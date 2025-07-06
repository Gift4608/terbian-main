#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_DIR="$PROJECT_DIR/installed-xroot/xroot"

if [ ! -d "$INSTALL_DIR" ]; then
    echo "No installed rootfs found at $INSTALL_DIR"
    exit 0
fi

read -p "Are you sure you want to remove installed rootfs? [y/N] " confirm
if [[ "$confirm" == [yY] ]]; then
    rm -rf "$INSTALL_DIR"
    echo "Rootfs removed."
else
    echo "Aborted."
fi
