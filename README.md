# n8n with Extended Service Stack

A comprehensive n8n setup with PostgreSQL database, Redis queue, Caddy reverse proxy, and additional AI/automation services including Flowise, Open WebUI, Qdrant vector database, and Neo4j graph database.

## Services Included

- [**Self-hosted n8n**](https://n8n.io/): Workflow automation tool (main service + worker)
- [**Flowise**](https://flowiseai.com/) - No/low code AI agent builder that pairs very well with n8nm
- [**Open WebUI**](https://openwebui.com/): ChatGPT-like interface to privately interact with your local models and N8N agents
- [**Qdrant**](https://qdrant.tech/) - Open source, high performance vector store with an comprehensive API. 
- [**Caddy**](https://caddyserver.com/): Reverse proxy with automatic HTTPS (gets your SSL certs automatically!)
- [**Neo4j**](https://neo4j.com/) - Knowledge graph engine that powers tools like GraphRAG, LightRAG, and Graphiti 
- [**PostgreSQL**](https://www.postgresql.org/): Database backend for n8n
- [**Redis**](https://redis.io/): Queue backend for n8n workflows


## Prerequisites

First, install the necessary software:

- [Git/GitHub Desktop](https://desktop.github.com/) - For easy repository management
- [Docker/Docker Desktop](https://www.docker.com/products/docker-desktop/) - Required to run all services


## Installation

Clone the repository and navigate to the project directory:
```bash
git clone https://github.com/elliotboney/n8n-docker/
cd n8n-docker
```


## Configuration

### .env
1. Copy the example to `.env`:
```bash
cp .env.example .env
```
2. Fill in all the placeholder values with your own, unique, and strong credentials.
3. Make sure to set the correct permissions on the `.env` file to protect sensitive information (e.g., `chmod 600 .env`).


## Start

To start the entire stack, simply start docker-compose by executing the following
command in the current folder.

**IMPORTANT:** But before you do that change the default users and passwords in the [`.env`](.env) file!

```bash
docker-compose up -d
```

To stop it execute:

```bash
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
