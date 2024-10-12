# Enables the workflow of building, storing, running, and testing a container image using Google Cloud services and Docker

## Creates a new Artifact Registry repository in Google Cloud to store Docker container images.
```bash
gcloud artifacts repositories create devops-repo --repository-format=docker --location="us-central1"
```
## Before pushing or pulling Docker images to/from Artifact Registry, you need to authenticate Docker with your Google Cloud account.
```bash
gcloud auth configure-docker us-central1-docker.pkg.dev
```
- It allows Docker to pull/push images from/to the Google Cloud Artifact Registry without needing to manually provide authentication details.

## Builds a Docker image and pushes it to the Google Cloud Artifact Registry
- gcloud builds submit --tag HOST-NAME/PROJECT-ID/REPOSITORY/IMAGE:TAG
```bash
gcloud builds submit --tag us-central1-docker.pkg.dev/mineral-oxide-437114-b7/devops-repo/my-first-app
```
- It uploads your local codebase to Google Cloud Build, which builds the Docker image and pushes it to the specified Artifact Registry repository.

## List all the Docker images stored in the specified Artifact Registry repository (devops-repo).
```bash
gcloud container images list --repository=us-central1-docker.pkg.dev/mineral-oxide-437114-b7/devops-repo

gcloud container images list-tags us-central1-docker.pkg.dev/mineral-oxide-437114-b7/devops-repo/my-first-app

```
## Runs a Docker container from the image stored in the Artifact Registry
```bash
docker run -p 80:80 us-central1-docker.pkg.dev/mineral-oxide-437114-b7/devops-repo/my-first-app
```
- It starts a container using the image us-central1-docker.pkg.dev/mineral-oxide-437114-b7/devops-repo/my-first-app and exposes it on port 80 of your host machine.

## (Optional) To check the logs of the running Docker container.
```bash
docker logs <docker-id>
```
## Test HTTP request to the application running inside the Docker container, which is bound to port 80
```bash
curl http://0.0.0.0:80
```