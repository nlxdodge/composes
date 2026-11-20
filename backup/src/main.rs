use notify::{Config, Event, EventKind, RecommendedWatcher, RecursiveMode, Watcher};
use std::env;
use std::path::{Path, PathBuf};
use std::process::{Command, ExitCode};
use std::sync::mpsc::{self, RecvTimeoutError};
use std::time::{Duration, Instant};

const BACKEND_DIR: &str = "/source/backend";
const BACKUPS_DIR: &str = "/source/backups";
const DEFAULT_CONFIG: &str = "/config/rclone/rclone.conf";
const DEFAULT_REMOTE: &str = "mega:keydungeon";

struct Settings {
    env_file: PathBuf,
    backups_dir: PathBuf,
    config: PathBuf,
    remote: String,
    debounce: Duration,
}

fn settings() -> Settings {
    let debounce = env::var("WATCH_DEBOUNCE_SECONDS")
        .ok()
        .and_then(|value| value.parse::<f64>().ok())
        .filter(|seconds| seconds.is_finite() && *seconds >= 0.1)
        .unwrap_or(2.0);

    Settings {
        env_file: Path::new(BACKEND_DIR).join(".env"),
        backups_dir: PathBuf::from(BACKUPS_DIR),
        config: env::var_os("RCLONE_CONFIG")
            .map(PathBuf::from)
            .unwrap_or_else(|| PathBuf::from(DEFAULT_CONFIG)),
        remote: env::var("MEGA_REMOTE")
            .unwrap_or_else(|_| DEFAULT_REMOTE.to_owned())
            .trim_end_matches('/')
            .to_owned(),
        debounce: Duration::from_secs_f64(debounce),
    }
}

fn upload(settings: &Settings, label: &str, args: &[&Path]) {
    println!("Uploading {label} to {}...", settings.remote);
    let result = Command::new("rclone")
        .args(args)
        .arg("--ignore-times")
        .arg("--config")
        .arg(&settings.config)
        .status();

    match result {
        Ok(status) if status.success() => println!("Upload complete for {label}."),
        Ok(status) => eprintln!("Upload failed for {label} (rclone exit {status})."),
        Err(error) => eprintln!("Could not run rclone for {label}: {error}"),
    }
}

fn backup(settings: &Settings) {
    if settings.env_file.is_file() {
        let destination = format!("{}/.env", settings.remote);
        upload(
            settings,
            "backend .env",
            &[
                Path::new("copyto"),
                &settings.env_file,
                Path::new(&destination),
            ],
        );
    } else {
        eprintln!("Skipping missing file: {}", settings.env_file.display());
    }

    if settings.backups_dir.is_dir() {
        let destination = format!("{}/backups", settings.remote);
        upload(
            settings,
            "backup directory",
            &[
                Path::new("copy"),
                &settings.backups_dir,
                Path::new(&destination),
            ],
        );
    } else {
        eprintln!(
            "Skipping missing directory: {}",
            settings.backups_dir.display()
        );
    }
}

fn is_change(event: &Event) -> bool {
    matches!(event.kind, EventKind::Create(_) | EventKind::Modify(_))
}

fn main() -> ExitCode {
    let settings = settings();
    if !Path::new(BACKEND_DIR).is_dir() || !settings.backups_dir.is_dir() {
        eprintln!("Both source directories must be mounted before starting.");
        return ExitCode::FAILURE;
    }
    if !settings.config.is_file() {
        eprintln!("rclone config not found: {}", settings.config.display());
        return ExitCode::FAILURE;
    }

    let (sender, receiver) = mpsc::channel();
    let mut watcher = match RecommendedWatcher::new(sender, Config::default()) {
        Ok(watcher) => watcher,
        Err(error) => {
            eprintln!("Could not initialize filesystem watcher: {error}");
            return ExitCode::FAILURE;
        }
    };
    for directory in [Path::new(BACKEND_DIR), settings.backups_dir.as_path()] {
        if let Err(error) = watcher.watch(directory, RecursiveMode::Recursive) {
            eprintln!("Could not watch {}: {error}", directory.display());
            return ExitCode::FAILURE;
        }
    }

    println!("Initial backup starting.");
    backup(&settings);
    println!(
        "Watching sources; changes are debounced for {:.1}s.",
        settings.debounce.as_secs_f64()
    );

    loop {
        match receiver.recv() {
            Ok(Ok(event)) if is_change(&event) => {
                let mut deadline = Instant::now() + settings.debounce;
                loop {
                    match receiver.recv_timeout(deadline.saturating_duration_since(Instant::now()))
                    {
                        Ok(Ok(event)) if is_change(&event) => {
                            deadline = Instant::now() + settings.debounce;
                        }
                        Ok(Ok(_)) => {}
                        Ok(Err(error)) => eprintln!("Filesystem watcher error: {error}"),
                        Err(RecvTimeoutError::Timeout) => break,
                        Err(RecvTimeoutError::Disconnected) => {
                            eprintln!("Filesystem watcher stopped unexpectedly.");
                            return ExitCode::FAILURE;
                        }
                    }
                }
                println!("Source change detected; backing up current files.");
                backup(&settings);
            }
            Ok(Ok(_)) => {}
            Ok(Err(error)) => eprintln!("Filesystem watcher error: {error}"),
            Err(error) => {
                eprintln!("Filesystem watcher stopped: {error}");
                return ExitCode::FAILURE;
            }
        }
    }
}
