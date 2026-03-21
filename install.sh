#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "======================================"
echo " Switch SteamOS-like Installer"
echo "======================================"

run_step() {
  local script="$1"
  echo ""
  echo "▶ Running $script"
  bash "$ROOT_DIR/scripts/$script"
}

run_step "00-check-host.sh"
run_step "01-install-prereqs.sh"

echo ""
echo "✅ Installation phase 1 terminée"
echo "➡️ Prochaine étape : Gamescope + FEX"
