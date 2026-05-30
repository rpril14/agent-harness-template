$ErrorActionPreference = "Stop"

$couplingFile = "harness/COUPLING.yaml"

if (-not (Test-Path $couplingFile)) {
    Write-Host "WARN: $couplingFile not found — coupling check skipped."
    exit 0
}

$changed = git diff HEAD --name-only 2>$null
if (-not $changed) {
    $raw = git status --porcelain 2>$null
    $changed = $raw | ForEach-Object { ($_ -replace '^\s*\S+\s+', '').Trim() } | Where-Object { $_ }
}

$nonHarness = $changed | Where-Object { $_ -and ($_ -notmatch "^harness/") }

if (-not $nonHarness) {
    exit 0
}

Write-Host "Coupling check — non-harness files changed:"
$nonHarness | ForEach-Object { Write-Host "  $_" }
Write-Host ""
Write-Host "Consult COUPLING.yaml and confirm all applicable rules are satisfied:"
Write-Host ""
Get-Content $couplingFile | ForEach-Object { Write-Host $_ }
Write-Host ""
Write-Host "If no coupling rules apply to this change, this reminder can be ignored."
