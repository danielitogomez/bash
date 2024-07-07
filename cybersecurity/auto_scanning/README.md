# Target Scan Tool

This repository contains a Docker-based tool with bash script for performing network scans on specified targets.

## Overview

### Script (`target-scan.sh`)

The main script `target-scan.sh` performs the following tasks:

1. **Initialize Reachable Hosts File**:
   - Creates or clears a temporary file to store the list of reachable hosts.

2. **Ping Sweep Function** (`pingsweep`):
   - Pings each target to check if it's reachable.
   - Logs reachable hosts to the temporary file.

3. **Display Reachable Hosts** (`display_reachable_hosts`):
   - Reads the temporary file and displays the list of reachable hosts.

4. **Target Scan Function** (`target_scan`):
   - Uses `nmap` to perform a network scan on the reachable hosts and displays the results.

5. **Read Targets from File** (`read_targets`):
   - Reads the targets from a `targets.txt` file.

6. **Main Function** (`main`):
   - Orchestrates the above functions to perform the complete scan.

### Dockerfile

The `Dockerfile` sets up the environment to run the `target-scan.sh` script inside a Docker container:

1. **Base Image**: Uses the latest Alpine image.
2. **Working Directory**: Sets the working directory to `/script`.
3. **Copy Files**: Copies the `target-scan.sh` script and `targets.txt` file into the container.
4. **Install Packages**: Installs necessary packages (`bash`, `nmap`, `nmap-scripts`) and makes the script executable.
5. **Entry Point**: Sets the entry point to the `target-scan.sh` script.

### Bash Script (`run.sh`)

The `run.sh` script builds the Docker image and runs the container:

```bash
#!/bin/bash

name="target-scan"

docker build -t $name . && docker run $name
```

### Build the Tool from Dockerfile
```bash
   docker build -t target-scan .
```

### Run the Docker Container:
```bash
   docker run target-scan
```

### Pull and Run the Docker Image from Docker Hub:
```bash
   docker pull danielgomeza/target-scan:latest
   docker run --rm danielgomeza/target-scan:latest
```

### CI/CD Workflow

1. The CI/CD workflow is managed using GitHub Actions. The workflow is designed to build and push the Docker image whenever changes are pushed to the master branch, a pull request is merged into the master branch, or it is manually triggered.

### CI/CD Flow Explanation

**Triggers:**
- The workflow triggers on a push to the `master` branch.
- It also triggers on a pull request to the `master` branch.
- Additionally, it can be manually triggered via the GitHub Actions tab using `workflow_dispatch`.

### Jobs:

- **Checkout**: The repository is checked out using `actions/checkout@v2` to access the code and files.
- **Setup Docker Buildx**: Docker Buildx is set up using `docker/setup-buildx-action@v2` to ensure compatibility and build capabilities.
- **Build Docker Image**: The Docker image is built using the Dockerfile in the repository.
- **Log in to Docker Hub**: The action logs in to Docker Hub using the credentials stored in GitHub Secrets.
- **Tag Docker Image**: The Docker image is tagged with the username and repository on Docker Hub.
- **Push Docker Image**: The Docker image is pushed to Docker Hub.

### Outcome

- The workflow ensures that the Docker image is automatically built and pushed to Docker Hub whenever changes are made to the `master` branch or merged via a pull request.
- This setup ensures that the latest version of the `target-scan` tool is always available on Docker Hub.

### Jenkins directory

1. The Jenkins Dockerfile, Jenkinsfile, and docker-compose files are useful for managing the end-to-end (E2E) flow from the Jenkins side. You can run it locally or on a virtual machine (VM) from any cloud provider

## ToDo

- **Improve Scanning Report**: Implement a more detailed and user-friendly report for the scanning results.

