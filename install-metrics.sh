#!/bin/bash
set -e

# Variables
REPO_FOLDER="https://github.com/nfworking/homelab/trunk/remote-config/alloy"
INSTALL_DIR="/opt/alloy"
TMP_DIR="/tmp/alloy_export"

echo "Installing required packages..."
apt update
apt install -y curl unzip subversion

echo "Preparing directories..."
mkdir -p "$INSTALL_DIR"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

echo "Downloading latest alloy folder..."
svn export --force "$REPO_FOLDER" "$TMP_DIR"

echo "Updating install directory..."
rm -rf "$INSTALL_DIR"/*
cp -r "$TMP_DIR"/* "$INSTALL_DIR"

cd "$INSTALL_DIR"

echo "Pulling latest Docker images..."
docker compose pull

echo "Starting containers..."
docker compose up -d

echo "Deployment complete."