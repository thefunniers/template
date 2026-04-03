# Backup Copilot workspace files to .github/backup/<timestamp>/
#
# Usage:
#   copilotBackup.ps1              — Full backup: Scrum + Design + Impl + Doc (after Doc Sync)
#   copilotBackup.ps1 -TaskOnly    — Task backup: Design + Impl only (after each Impl completes)

param(
    [switch]$TaskOnly
)

$workspaceDir = Resolve-Path -LiteralPath "$PSScriptRoot\..\workspace"
$backupRoot   = "$PSScriptRoot\..\backup"

# Collect files to backup based on mode
if ($TaskOnly) {
    $filesToBackup = @(
        "Copilot_Design.md",
        "Copilot_Impl.md"
    )
    $cleanupMessage = "Task workspace cleaned. Ready for next Design-Impl cycle."
} else {
    $filesToBackup = @(
        "Copilot_Scrum.md",
        "Copilot_Design.md",
        "Copilot_Impl.md",
        "Copilot_Doc.md"
    )
    $cleanupMessage = "Full workspace cleaned. Ready for next Scrum cycle."
}

$existing = @()
foreach ($name in $filesToBackup) {
    $path = Join-Path $workspaceDir $name
    if (Test-Path $path) {
        $existing += $path
    }
}

if ($existing.Count -eq 0) {
    Write-Host "No workspace files found to backup."
    exit 0
}

# Create timestamped backup folder
$timestamp = Get-Date -Format "yyyy-MM-dd-HH-mm-ss"
$backupFolder = Join-Path $backupRoot $timestamp

Write-Host "Creating backup folder: $backupFolder"
New-Item -ItemType Directory -Path $backupFolder -Force | Out-Null

# Copy each file
foreach ($filePath in $existing) {
    $fileName = Split-Path $filePath -Leaf
    $dest = Join-Path $backupFolder $fileName
    Write-Host "Backing up $fileName ..."
    Copy-Item -Path $filePath -Destination $dest -Force
}

Write-Host "Backup completed: $backupFolder"

# Clean up workspace files (reset for next cycle)
foreach ($filePath in $existing) {
    $fileName = Split-Path $filePath -Leaf
    Write-Host "Removing $fileName from workspace..."
    Remove-Item -Path $filePath -Force
}

Write-Host $cleanupMessage
