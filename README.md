# Docker MariaDB Galera Cluster Deployment Guide
# Galera Cluster Deployment Guide

## Prerequisites
Ensure that you have Docker and Docker Swarm initialized on your system.

### Initialize Docker Swarm
```sh
docker swarm init
```

## Deploying Galera Cluster
1. Navigate to the directory containing `docker-compose.yaml`:
   ```sh
   cd ~/Desktop/docker/galera
   ```
2. Deploy the stack:
   ```sh
   docker stack deploy -c docker-compose.yaml galera
   ```

## Checking Cluster Services
To list running services in the Galera cluster:
```sh
docker stack services galera
```

## Accessing a Galera Node
To enter a running Galera container, execute:
```sh
docker exec -it $(docker ps -q --filter name=galera_seed) mysql -u nextcloud_user -p
```
Then, enter the password when prompted.

## Checking Cluster Status
Once inside the MariaDB shell, check the cluster size with:
```sql
SHOW STATUS LIKE 'wsrep_cluster_size';
```
This command returns the number of nodes in the Galera cluster.

## Troubleshooting
- If the cluster does not start, check the logs:
  ```sh
  docker logs $(docker ps -q --filter name=galera_seed)
  ```
- Ensure secrets files exist in `.secrets/` directory if using file-based authentication.
- Verify network settings in `docker-compose.yaml` to ensure proper overlay network configuration.

## Stopping and Removing the Stack
To remove the Galera stack:
```sh
docker stack rm galera
```
This will remove all services associated with the stack.