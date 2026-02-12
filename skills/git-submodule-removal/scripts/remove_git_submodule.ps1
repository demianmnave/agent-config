<#
.SYNOPSIS
    Script to remove a Git submodule cleanly and deterministically in PowerShell.

.DESCRIPTION
    This script removes all references to a Git submodule, updates .gitmodules, removes cached data, and commits the changes.

.PARAMETER SubmodulePath
    The relative path to the submodule to remove.

.EXAMPLE
    .\remove_git_submodule.ps1 -SubmodulePath "path/to/submodule"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$SubmodulePath,
    [string]$CommitMessage = ""
)

function Remove-GitSubmodule {
    param(
        [string]$Path,
        [string]$CommitMsg
    )

    # Check if .gitmodules exists
    if (-not (Test-Path -Path ".gitmodules")) {
        Write-Error ".gitmodules file not found. Are you in the root of a Git repository?"
        exit 1
    }

    # Deinitialize the submodule:
    git submodule deinit -f "$Path"

    # Remove the submodule entry from .gitmodules
    git config -f .gitmodules --remove-section "submodule.$Path" 2>$null

    # Remove the submodule entry from .git/config
    git config -f .git/config --remove-section "submodule.$Path" 2>$null

    # Remove the submodule directory from the index and working tree
    git rm -f $Path

    # Remove the submodule's Git directory
    Remove-Item -Recurse -Force ".git/modules/$Path" -ErrorAction SilentlyContinue

    # Remove the submodule directory if it still exists
    Remove-Item -Recurse -Force $Path -ErrorAction SilentlyContinue

    # Commit the changes if commit message is provided
    if ($CommitMsg -ne "") {
        git commit -m $CommitMsg
    }

    Write-Output "Submodule $Path removed successfully."
}

Remove-GitSubmodule -Path $SubmodulePath -CommitMsg $CommitMessage
