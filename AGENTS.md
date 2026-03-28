# AGENTS.md - Docker Compose Demo Project

## Project Overview

Docker Compose demo project with 15 service templates for development infrastructure deployment.

| Service | Directory | Service | Directory |
|---------|-----------|---------|-----------|
| Jenkins | `jenkins/` | ELK Stack | `elk/` |
| GitLab | `gitlab/` | Kafka | `kafka/` |
| Redis | `redis/` | MinIO | `minio/` |
| Nginx | `nginx/` | RabbitMQ | `rabbitmq/` |
| SonarQube | `sonarqube/` | Zookeeper | `zookeeper/` |
| MySQL | `mysql/` | Portainer | `portainer/` |
| PostgreSQL | `pgsql/` | RocketMQ | `rocketmq/` |
| NSQ | `nsq/` | | |

---

## Docker Compose Commands

```bash
# Start services
docker-compose up -d
docker-compose -f <service>/docker-compose.yml up -d

# Stop services
docker-compose stop

# View status/logs
docker-compose ps
docker-compose logs -f

# Remove containers/volumes
docker-compose down
docker-compose down -v

# Rebuild and pull
docker-compose build --no-cache
docker-compose pull
```

### Service Examples
```bash
cd redis && docker-compose up -d    # Start Redis
cd elk && docker-compose up -d      # Start ELK stack
cd mysql && docker-compose up -d    # Start MySQL
```

---

## Code Style Guidelines

This project contains **Docker Compose YAML files only**.

### YAML Formatting
- 2 spaces for indentation (no tabs)
- Use `lowercase` for keys
- Use anchors (`&`) and aliases (`*`) for repeated values

### Naming Conventions
- Files: `docker-compose.yml`
- Services/containers/networks/volumes: lowercase with hyphens (e.g., `my-service`)

### Best Practices
1. Specify image versions (avoid `latest`)
2. Set resource limits via `deploy.resources.limits`
3. Use named volumes over anonymous volumes
4. Define restart policies (`restart: unless-stopped`)
5. Add `healthcheck` for critical services
6. Use `.env` file for sensitive data
7. Define explicit networks for service isolation
8. Use non-privileged ports (1024+)

---

## Error Handling

### Common Issues
- **Port conflicts**: `lsof -i :<port>`
- **Volume permissions**: Fix with `chmod` or `chown`
- **Memory limits**: Increase Docker Desktop memory
- **Image pull failures**: Check network connectivity

### Troubleshooting
```bash
docker ps -a                    # Container status
docker logs <container_name>   # View logs
docker inspect <container_name>  # Inspect
docker stats                   # Resource usage
docker exec -it <container> /bin/bash  # Shell access
```

---

## Project Structure

```
docker-compose-demo/
├── AGENTS.md, README.md, .gitignore
├── jenkins/, gitlab/, redis/, nginx/, sonarqube/
├── mysql/, pgsql/, elk/, kafka/, minio/
├── rabbitmq/, zookeeper/, portainer/, rocketmq/, nsq/
└── script/install-docker.sh
```

---

## Notes for Agents

- No application source code - infrastructure/deployment configs only
- Each service directory has its own `docker-compose.yml`
- No build/test/lint processes to run
- Modify only docker-compose files or documentation
- Verify port availability before starting services
- Backup volumes before `docker-compose down -v`
