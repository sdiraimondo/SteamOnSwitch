#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/lib.sh"

require_root

log "=== INSTALL PREREQUISITES ==="

apt update

apt install -y \
  curl \
  wget \
  git \
  build-essential \
  mesa-utils \
  vulkan-tools \
  software-properties-common \
  ca-certificates \
  xwayland \
  weston \
  dbus-user-session \
  pipewire \
  wireplumber \
  libgl1-mesa-dri

log "Pré-requis installés"
