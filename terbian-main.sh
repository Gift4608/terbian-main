#!/data/data/com.termux/files/usr/bin/bash

# === Auto-detect project directory ===
PROJECT_DIR="$(dirname "$0")"
SCRIPT_DIR="$PROJECT_DIR/scripts"

INSTALL_SCRIPT="$SCRIPT_DIR/install.sh"
REMOVE_SCRIPT="$SCRIPT_DIR/remove.sh"
START_SCRIPT="$SCRIPT_DIR/start.sh"

# === Command router ===
case "$1" in
    install)
        bash "$INSTALL_SCRIPT"
        ;;
    remove)
        bash "$REMOVE_SCRIPT"
        ;;
    start)
        bash "$START_SCRIPT"
        ;;
    help|--help|-h|"")
        echo "Usage: ./terbian-main.sh <command>"
        echo ""
        echo "Available commands:"
        echo "  install     Install Debian from xroot.tar.gz"
        echo "  remove      Remove installed Debian rootfs"
        echo "  start       Launch Debian environment"
        echo "  help        Show this message"
        ;;
    *)
        echo "[Error] Unknown command: $1"
        echo "Run './terbian-main.sh help' for a list of available commands."
        exit 1
        ;;
esac
