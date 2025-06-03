# n8n with Extended Service Stack

A comprehensive n8n setup with PostgreSQL database, Redis queue, Caddy reverse proxy, and additional AI/automation services including Flowise, Open WebUI, Qdrant vector database, and Neo4j graph database.

## Services Included

- **n8n**: Workflow automation tool (main service + worker)
- **PostgreSQL**: Database backend for n8n
- **Redis (Valkey)**: Queue backend for n8n workflows
- **Caddy**: Reverse proxy with automatic HTTPS
- **Flowise**: Low-code LLM apps builder
- **Open WebUI**: Web interface for LLMs
- **Qdrant**: Vector database for AI applications
- **Neo4j**: Graph database


## Configuration

### .env
1. Copy the example to `.env`:
```
cp .env.example .env
```
2. Fill in all the placeholder values with your own, unique, and strong credentials.
3. Make sure to set the correct permissions on the `.env` file to protect sensitive information (e.g., `chmod 600 .env`).


## Start

To start the entire stack, simply start docker-compose by executing the following
command in the current folder.

**IMPORTANT:** But before you do that change the default users and passwords in the [`.env`](.env) file!

```
docker-compose up -d
```

To stop it execute:

```
docker-compose stop
```

## Service URLs

When running with hostnames configured in your `.env` file:
- n8n: https://your-n8n-hostname
- Open WebUI: https://your-webui-hostname  
- Flowise: https://your-flowise-hostname
- Neo4j: https://your-neo4j-hostname

When running locally without custom hostnames:
- n8n: http://localhost:8001
- Open WebUI: http://localhost:8002
- Flowise: http://localhost:8003
- Neo4j: http://localhost:8008
