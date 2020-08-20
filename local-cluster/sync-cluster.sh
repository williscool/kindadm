#!/usr/bin/env bash
set -e

# Deploy desired svc-s
helmfile -f ./helmfile.yaml sync > /dev/null

# Admin setup

kubectl replace -f dashboard-admin-rbac.yaml

# https://codelearn.me/2019/01/13/wsl-windows-toast.html
# https://github.com/microsoft/WSL/issues/2466#issuecomment-662184581
if grep -q Microsoft /proc/version; then
 powershell.exe 'New-BurntToastNotification -Text "Cluster is Up!" -Sound "Default" -SnoozeAndDismiss'
fi
