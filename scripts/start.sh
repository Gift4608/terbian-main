#!/data/data/com.termux/files/usr/bin/bash

# === Auto-detect project directory ===
PROJECT_DIR="$(dirname "$(dirname "$0")")"
BIN_DIR="$PROJECT_DIR/bin"
ROOTFS_DIR="$PROJECT_DIR/installed-xroot/xroot"
PROOT_BIN="$BIN_DIR/terbian-proot"

echo "[Terbian Starter]"

# Select proot binary
if [ -x "$PROOT_BIN" ]; then
    PROOT="$PROOT_BIN"
elif command -v proot >/dev/null 2>&1; then
    PROOT="proot"
else
    echo "[Error] proot not found. Please install it via 'pkg install proot'."
    exit 1
fi

# Check if rootfs exists
if [ ! -d "$ROOTFS_DIR" ]; then
    echo "[Error] Debian rootfs not found. Please run install.sh first."
    exit 1
fi

echo "[Info] Starting Debian rootfs..."

$PROOT \
  --link2symlink \
  -0 \
  -r "$ROOTFS_DIR" \
  -b /dev \
  -b /proc \
  -b /sys \
  -b /sdcard:/root/sdcard \
  -w /root \
  /usr/bin/env -i \
    HOME=/root \
    PATH=/usr/local/sbin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin \
    TERM="$TERM" \
    LANG=C.UTF-8 \
    /bin/bash --login
