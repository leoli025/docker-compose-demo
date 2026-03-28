# NSQ Service

NSQ is a real-time distributed messaging platform designed to operate at scale.

## Services

- **nsqlookupd**: Service discovery for NSQ
- **nsqd**: Message queue daemon
- **nsqadmin**: Web UI for managing NSQ

## Ports

| Service | Port | Description |
|---------|------|-------------|
| nsqlookupd | 4160 | TCP port |
| nsqlookupd | 4161 | HTTP port |
| nsqd | 4150 | TCP port |
| nsqd | 4151 | HTTP port |
| nsqadmin | 4171 | Web UI |

## Usage

```bash
# Start services
cd nsq && docker-compose up -d

# Stop services
cd nsq && docker-compose stop

# View status
cd nsq && docker-compose ps

# View logs
cd nsq && docker-compose logs -f

# Remove containers
cd nsq && docker-compose down
```

## Access

- **Web UI**: http://localhost:4171
- **HTTP API**: http://localhost:4151
- **TCP Connection**: localhost:4150

## Configuration

The service uses the official NSQ image with version v1.2.1. You can modify the command parameters in `docker-compose.yaml` to customize the NSQ configuration.

## Notes

- NSQ requires nsqlookupd to be running before nsqd and nsqadmin
- The default configuration is suitable for development environments
- For production environments, consider adding volume mounts for data persistence and adjusting resource limits
