#!/usr/bin/env bash
set -eu

LIGHT_GREEN='\033[1;32m'
NC='\033[0m'   # No Color
SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 ; pwd -P )"
CACHE_DIR="$SCRIPT_DIR/.cache"
EXEC_DIR="$CACHE_DIR"

# Deploy desired svc-s
# Deploy default apps
echo -e "\n${LIGHT_GREEN}Deploying default apps...${NC}"
create_k8s_ns "default"
"$EXEC_DIR"/helmfile -b "$EXEC_DIR"/helm -f "$SCRIPT_DIR"/helmfiles/apps/default/helmfile.yaml sync --concurrency 1 > /dev/null
echo -e "${LIGHT_GREEN}\u2713${NC} Default apps - ${LIGHT_GREEN}deployed${NC}."

# https://codelearn.me/2019/01/13/wsl-windows-toast.html
# https://github.com/microsoft/WSL/issues/2466#issuecomment-662184581
if grep -q Microsoft /proc/version; then
 powershell.exe 'New-BurntToastNotification -Text "Cluster is Up!" -Sound "Default" -SnoozeAndDismiss'
fi
