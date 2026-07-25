#!/bin/bash

# Hentikan script jika terjadi error
set -e

# Konfigurasi image
DOCKERHUB_USERNAME="adam23rd"
IMAGE_NAME="karsajobs"
IMAGE_TAG="latest"

# Pastikan password tersedia
: "${PASSWORD_DOCKER_HUB:?PASSWORD_DOCKER_HUB belum diatur}"

# Build image backend
docker build \
  -t "${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}" .

# Login ke Docker Hub
echo "${PASSWORD_DOCKER_HUB}" | docker login \
  -u "${DOCKERHUB_USERNAME}" \
  --password-stdin

# Push image backend
docker push "${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "Image backend berhasil diunggah."
