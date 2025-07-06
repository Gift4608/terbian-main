#!/bin/bash

ACTION="$1"

case "$ACTION" in
    install)
        bash scripts/install.sh
        ;;
    remove)
        bash scripts/remove.sh
        ;;
    start)
        bash scripts/start.sh
        ;;
    help|"")
        echo "Usage: ./terbian-main.sh [install | remove | start | help]"
        ;;
    *)
        echo "Unknown command: $ACTION"
        echo "Usage: ./terbian-main.sh [install | remove | start | help]"
        exit 1
        ;;
esac
