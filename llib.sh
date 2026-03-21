#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/../config/switch-steamos.conf"

[[ -f "$CONFIG_FILE" ]] && source "$CONFIG_FILE"

LOG_DIR="${LOG_DIR:-/var/log/switch-steamos}"
mkdir -p "$LOG_DIR"

SCRIPT_NAME="$(basename "$0")"
LOG_FILE="$LOG_DIR/${SCRIPT_NAME%.sh}.log"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

die() {
  log "ERROR: $*"
  exit 1
}

require_root() {
  [[ "${EUID}" -eq 0 ]] || die "Doit être exécuté en root"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}
