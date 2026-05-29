# Test Matrix

Use this matrix to decide which checks are required for each kind of change.
Prefer fast, targeted checks first, then broader checks for integration and user workflows.

| Change type | Required checks |
|---|---|
| Product requirement | Acceptance criteria updated; affected user flow documented |
| UI component | Logic test if behavior exists; interaction or visual smoke check; accessibility basics checked |
| User workflow | Integration or end-to-end check for the primary path; error and empty states considered |
| API or route | Success case; validation failure; authorization or permission case if applicable |
| Domain logic | Unit tests for normal, boundary, and error cases |
| Database or schema | Migration path; affected queries checked; rollback or recovery note when relevant |
| Auth or permissions | Positive and negative permission tests; session or token edge cases considered |
| External integration | Contract assumptions documented; failure, timeout, and retry behavior checked |
| Configuration | Startup check; missing or invalid config behavior checked |
| Security-sensitive change | `SECURITY.md` reviewed; abuse case or threat noted |
| Bug fix | Regression test or reproducible validation for the reported failure |
| Refactor | Existing behavior preserved; relevant tests pass |
| Documentation-only | Links and referenced commands checked where practical |

## Default Verification

Run:

```sh
./harness/scripts/verify
```

On Windows PowerShell:

```powershell
./harness/scripts/verify.ps1
```

After the project stack is selected, this command should include the project's normal format, lint, typecheck, test, and build checks where applicable.
Use `ENFORCEMENT.md` to decide when repeated issues should become scripts, lint rules, CI checks, or other machine-checkable validation.

## Recording Gaps

If a required check cannot be run, record:

- What was not run.
- Why it was not run.
- What risk remains.
