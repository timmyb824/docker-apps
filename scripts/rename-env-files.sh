#!/usr/bin/env bash
set -euo pipefail

# Base directory to search — defaults to current directory
BASE_DIR="${1:-.}"

# Find files like .something.sops recursively
find "$BASE_DIR" -type f -name ".*.sops" | while IFS= read -r file; do
	dir=$(dirname "$file")
	newname="${dir}/.app.env"

	# Skip if target already exists
	if [[ -e "$newname" ]]; then
		echo "⚠️  Skipping (already exists): $newname"
		continue
	fi

	echo "Renaming: $file → $newname"
	mv "$file" "$newname"
done

echo "✅ Done renaming .*.sops → .app.env"
