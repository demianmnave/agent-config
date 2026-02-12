---
name: git-submodule-removal
description: Use this skill when the user wants to completely remove a git submodule defined by a relative path.
---

# Git Submodule Removal

## Steps

1. Identify the submodule path and name to be removed.
2. You MUST present the user with three options for handling the commit:
   - Specify a custom commit message.
   - Allow the agent to automatically generate a commit message (e.g., "Remove submodule <submodule-path>").
   - Skip the commit entirely.
3. You MUST execute the appropriate command line for the user's platform and selection, using full script path for transparency:
   - For Bash: `scripts/remove_git_submodule.sh <submodule-path> [commit-message]` (omit commit-message to skip commit)
   - For PowerShell: `scripts/remove_git_submodule.ps1 -SubmodulePath <submodule-path> [-CommitMessage <commit-message>]` (omit CommitMessage to skip commit)

## Scripts

- `scripts/remove_git_submodule.sh`: Bash script for Unix-like systems (Linux, macOS, WSL, etc.).
  - **Arguments:**
    - `<submodule-path>`: (required) Relative path to the submodule to remove.
    - `[commit-message]`: (optional) If provided and non-empty, commits the removal with this message. If omitted or empty, no commit is performed.
  - **Usage Example:**
    - `./remove_git_submodule.sh path/to/submodule "Remove submodule path/to/submodule"`
    - `./remove_git_submodule.sh path/to/submodule` (no commit)

- `scripts/remove_git_submodule.ps1`: PowerShell script for Windows systems.
  - **Arguments:**
    - `-SubmodulePath <string>`: (required) Relative path to the submodule to remove.
    - `-CommitMessage <string>`: (optional) If provided and non-empty, commits the removal with this message. If omitted or empty, no commit is performed.
  - **Usage Example:**
    - `./remove_git_submodule.ps1 -SubmodulePath "path/to/submodule" -CommitMessage "Remove submodule path/to/submodule"`
    - `./remove_git_submodule.ps1 -SubmodulePath "path/to/submodule"` (no commit)

## Error Handling

- On error do NOT continue processing; immediately stop and ask the user how to proceed