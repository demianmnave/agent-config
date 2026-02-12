#!/bin/bash

# Script to remove a Git submodule cleanly and deterministically

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <submodule-path> [commit-message]"
  exit 1
fi

SUBMODULE_PATH="$1"
COMMIT_MESSAGE="${2-}"

# Check if .gitmodules exists
if [ ! -f .gitmodules ]; then
  echo ".gitmodules file not found. Are you in the root of a Git repository?"
  exit 1
fi

# Deinitialize the submodule:
git submodule deinit -f "$Path"

# Remove the submodule entry from .gitmodules
git config -f .gitmodules --remove-section "submodule.$SUBMODULE_PATH" 2>$null

# Remove the submodule entry from .git/config
git config -f .git/config --remove-section "submodule.$SUBMODULE_PATH" || true

# Remove the submodule directory from the index and working tree
git rm -f "$SUBMODULE_PATH"

# Remove the submodule's Git directory
rm -rf ".git/modules/$SUBMODULE_PATH"

# Remove the submodule directory if it still exists
rm -rf "$SUBMODULE_PATH"

# Commit the changes if commit message is provided
if [ -n "$COMMIT_MESSAGE" ]; then
  git commit -m "$COMMIT_MESSAGE"
fi

echo "Submodule $SUBMODULE_PATH removed successfully."