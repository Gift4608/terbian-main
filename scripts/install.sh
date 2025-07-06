#!/bin/bash

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DISTRO_DIR="$PROJECT_DIR/distro"
ARCHIVE="$DISTRO_DIR/xroot.tar.gz"
INSTALL_DIR="$PROJECT_DIR/installed-xroot/xroot"

if [ ! -f "$ARCHIVE" ]; then
    echo "Downloading latest xroot.tar.gz from GitHub Releases..."
    wget -O "$ARCHIVE" "https://github.com/Gift4608/terbian-xroot/releases/latest/download/xroot.tar.gz"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to download xroot.tar.gz"
        exit 1
    fi
else
    echo "xroot.tar.gz already exists."
fi

echo "Extracting xroot.tar.gz..."
rm -rf "$INSTALL_DIR"/*
tar -xf "$ARCHIVE" -C "$INSTALL_DIR"

echo "Installation complete."
