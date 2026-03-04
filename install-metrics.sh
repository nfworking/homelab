#!/bin/bash
set -e

# Variables
REPO="git@github.com:nfworking/homelab.git"
BRANCH="remote-config"
FOLDER="alloy"
INSTALL_DIR="/opt/alloy"
TMP_DIR="/tmp/alloy_checkout"

echo "Installing required packages..."
apt update
apt install -y curl unzip git

# Install Docker if missing
if ! command -v docker &> /dev/null; then
  echo "Docker not found, installing..."
  curl -fsSL https://get.docker.com | sh
fi

echo "Preparing directories..."
mkdir -p "$INSTALL_DIR"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

echo "Cloning sparse checkout of $FOLDER from branch $BRANCH..."
cd "$TMP_DIR"
git init
git remote add origin "$REPO"
git sparse-checkout init --cone
git sparse-checkout set "$FOLDER"
git fetch --depth=1 origin "$BRANCH"
git checkout "$BRANCH"

echo "Updating install directory..."
rm -rf "$INSTALL_DIR"/*
cp -r "$TMP_DIR/$FOLDER"/* "$INSTALL_DIR"

cd "$INSTALL_DIR"

echo "Pulling latest Docker images..."
docker compose pull

echo "Starting containers..."
docker compose up -d

echo "Deployment complete."