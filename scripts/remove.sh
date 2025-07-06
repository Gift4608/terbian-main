#!/data/data/com.termux/files/usr/bin/bash

# === Auto-detect project directory ===
PROJECT_DIR="$(dirname "$(dirname "$0")")"
TARGET_DIR="$PROJECT_DIR/installed-xroot/xroot"

echo "[Terbian Remover]"

# Check if rootfs exists
if [ ! -e "$TARGET_DIR" ]; then
    echo "[Info] Debian rootfs not found — nothing to remove."
    exit 0
fi

# Confirm deletion
read -p "Are you sure you want to remove the Debian rootfs? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "[Canceled] Removal aborted."
    exit 0
fi

echo "[Info] Removing $TARGET_DIR..."
rm -rf "$TARGET_DIR"

# Remove parent directory if empty
PARENT_DIR="$(dirname "$TARGET_DIR")"
if [ -d "$PARENT_DIR" ] && [ -z "$(ls -A "$PARENT_DIR")" ]; then
    rmdir "$PARENT_DIR"
fi

echo "[Done] Debian rootfs removed."
