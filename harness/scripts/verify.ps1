$ErrorActionPreference = "Stop"

# Harness integrity checks — always run regardless of project stack.

$required = @(
    "harness/PRODUCT.md",
    "harness/ARCHITECTURE.md",
    "harness/GLOSSARY.md",
    "harness/TEST_MATRIX.md",
    "harness/ENFORCEMENT.md",
    "harness/SECURITY.md",
    "harness/PLANS.md",
    "harness/CLAUDE.md"
)

$failed = $false

foreach ($f in $required) {
    if (-not (Test-Path $f)) {
        Write-Host "MISSING: $f"
        $failed = $true
    }
}

# Warn on active plans that have no Acceptance Criteria section.
$activePlans = Get-ChildItem -Path "harness/docs/plans/active" -Filter "*.md" -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -ne ".gitkeep" }

foreach ($plan in $activePlans) {
    $content = Get-Content $plan.FullName -Raw
    if ($content -notmatch "## Acceptance Criteria") {
        Write-Host "WARN: active plan missing Acceptance Criteria — $($plan.Name)"
    }
}

if ($failed) {
    Write-Host "Harness check failed. Restore missing files before continuing."
    exit 1
}

Write-Host "Harness check passed."
Write-Host ""
Write-Host "No project stack has been scaffolded yet."
Write-Host "Update harness/scripts/verify.ps1 after choosing a stack so this command runs format, lint, typecheck, test, and build checks."
