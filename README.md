# PalServer

## Description

PalServer is a game server deployed using Docker or Vagrant. This project uses Docker, Docker Compose, or Vagrant to create and manage the game server.

## Requirements

- Docker
- Docker Compose
- Vagrant
- VirtualBox

## Installation

### Docker Compose

1. Clone the repository:
    ```bash
    git clone https://github.com/NupaZzz/palw_server.git
    ```
2. Navigate to the project directory:
    ```bash
    cd palserver
    ```
3. Run Docker Compose:
    ```bash
    docker-compose up -d
    ```

### Vagrant

1. Clone the repository:
    ```bash
    git clone https://github.com/NupaZzz/palw_server.git
    ```
2. Navigate to the project directory:
    ```bash
    cd palserver
    ```
3. Run Vagrant:
    ```bash
    vagrant up
    ```

## Configuration

You can configure the game and console ports, as well as restrictions on CPU and memory usage, by modifying the environment variables in the `docker-compose.yml` and `Vagrantfile`.
