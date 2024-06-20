# How to setup

SonarQube uses a production database, for this we use Postgres. Make a `.env` file in the same directory with below filled in username and password for the default user.

#### .env

```txt
POSTGRES_USER=
POSTGRES_PASSWORD=
```

Next either use Docker or Podman etc. to create the stack.

```bash
docker-compose up -d
# or
podman-compose up -d
```

Now you have:

- A Postgres database running also for development 
- SonarQube to check your code quality and code itself
- GIT TODO?
