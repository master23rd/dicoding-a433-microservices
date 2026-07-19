#!/bin/bash

set -e

DOCKERHUB_USERNAME="adam23rd"
IMAGE_NAME="item-app"
IMAGE_TAG="v1"

echo "1. Build Docker image..."
docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" .

echo "2. Menampilkan daftar Docker image..."
docker images

echo "3. Mengubah nama/tag image untuk Docker Hub..."
docker tag \
  "${IMAGE_NAME}:${IMAGE_TAG}" \
  "${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "4. Login ke Docker Hub..."
docker login

echo "5. Push image ke Docker Hub..."
docker push "${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "Build dan push image selesai."
