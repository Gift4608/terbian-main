#!/data/data/com.termux/files/usr/bin/bash

# === Auto-detect project directory ===
PROJECT_DIR="$(dirname "$(dirname "$0")")"
DISTRO_TARBALL="$PROJECT_DIR/distro/xroot.tar.gz"
TARGET_DIR="$PROJECT_DIR/installed-xroot/xroot"

echo "[Terbian Installer]"

# Check if archive exists
if [ ! -f "$DISTRO_TARBALL" ]; then
    echo "[Error] Archive not found: $DISTRO_TARBALL"
    exit 1
fi

# If rootfs already exists, confirm overwrite
if [ -d "$TARGET_DIR" ]; then
    echo "[Warning] Existing rootfs detected at:"
    echo "          $TARGET_DIR"
    read -p "Do you want to overwrite it? (y/n): " confirm
    if [ "$confirm" != "y" ]; then
        echo "[Canceled] Installation aborted."
        exit 0
    fi
    echo "[Info] Removing existing rootfs..."
    rm -rf "$TARGET_DIR"
fi

# Create parent directory if needed
mkdir -p "$(dirname "$TARGET_DIR")"

# Extract the tarball
echo "[Info] Extracting xroot.tar.gz to $TARGET_DIR..."
tar -xzf "$DISTRO_TARBALL" -C "$(dirname "$TARGET_DIR")"

echo "[Done] Debian successfully installed."
