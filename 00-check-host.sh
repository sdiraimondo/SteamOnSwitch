#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/lib.sh"

require_root

log "=== PRE-CHECK SYSTEM ==="

ARCH="$(uname -m)"
log "Architecture: $ARCH"

[[ "$ARCH" == "aarch64" ]] || die "Architecture non supportée (attendu: aarch64)"

if command_exists lsb_release; then
  DISTRO="$(lsb_release -ds)"
  log "Distribution: $DISTRO"
fi

log "Kernel: $(uname -r)"

# GPU / DRM check
if [[ -e /dev/dri/renderD128 ]]; then
  log "DRM OK"
else
  log "⚠️ DRM non détecté"
fi

# Vulkan check
if command_exists vulkaninfo; then
  log "Vulkan présent"
else
  log "⚠️ Vulkan absent"
fi

# OpenGL check
if command_exists glxinfo; then
  log "OpenGL tools présents"
else
  log "⚠️ glxinfo absent"
fi

log "Pré-check terminé"
