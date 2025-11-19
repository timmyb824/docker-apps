#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/DEV/homelab/docker-apps"
BRANCH="main"
CONFIG="$REPO/gitops-apps.conf"

cd "$REPO"
git fetch origin "$BRANCH"

OLD_REV=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "origin/$BRANCH")

[ "$OLD_REV" = "$REMOTE" ] && exit 0

if ! git diff --quiet || ! git diff --quiet --cached; then
  echo "Working tree dirty, aborting deploy."
  exit 1
fi

git pull --ff-only origin "$BRANCH"

NEW_REV=$(git rev-parse HEAD)

redeploy_app() {
  local app_dir="$1"
  local service_name="$2"

  (
    cd "$app_dir" || exit 1

    systemctl --user stop "container-$service_name.service" 2>/dev/null || true
    systemctl --user disable "container-$service_name.service" 2>/dev/null || true

    podman-compose -p "$service_name" down || true

    podman-compose --in-pod=0 -p "$service_name" up -d --force-recreate

    podman_unit_create_service_file.sh "$service_name"
    systemctl --user daemon-reload
    systemctl --user enable --now "container-$service_name.service"

    systemctl --user list-units 'container*'
  )
}

# determine which app directories have changed files
mapfile -t changed_paths < <(git diff --name-only "$OLD_REV" "$NEW_REV")

changed_app_dirs=()
for app_dir in $(grep -vE '^\s*($|#)' "$CONFIG"); do
  for path in "${changed_paths[@]}"; do
    case "$path" in
      "$app_dir"/*)
        changed_app_dirs+=("$app_dir")
        break
        ;;
    esac
  done
done

# loop over managed apps that actually changed
for app_dir in "${changed_app_dirs[@]}"; do
  [ -z "$app_dir" ] && continue

  service_name="$(basename "$app_dir")"

  # 1) decrypt env
  if [ -f "$app_dir/.env.sops" ]; then
    sops -d "$app_dir/.env.sops" > "$app_dir/.env"
  fi

  # 2) redeploy
  redeploy_app "$app_dir" "$service_name"
done
