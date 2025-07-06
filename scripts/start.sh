#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_DIR="$PROJECT_DIR/installed-xroot/xroot"
PROOT_BIN="$PROJECT_DIR/bin/terbian-proot"

if [ ! -d "$INSTALL_DIR" ]; then
    echo "Installed rootfs not found at $INSTALL_DIR"
    exit 1
fi

if [ ! -x "$PROOT_BIN" ]; then
    echo "terbian-proot binary not found or not executable at $PROOT_BIN"
    exit 1
fi

exec "$PROOT_BIN" -r "$INSTALL_DIR" /usr/bin/bash
