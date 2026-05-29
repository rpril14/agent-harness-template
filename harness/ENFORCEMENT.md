# Enforcement

This file defines how harness rules become machine-checkable over time.

The v0 harness starts with lightweight enforcement:

- `harness/scripts/verify`
- `harness/scripts/verify.ps1`

After the project stack is scaffolded, these scripts should run the project's real checks.

## Enforcement Principles

- Prefer one default verification entrypoint per shell environment.
- Keep checks fast enough for local use.
- Promote repeated review comments into scripts, lint rules, tests, or CI checks.
- Promote repeatedly violated architecture rules into structural checks where practical.
- Security-sensitive rules should have tests, static checks, or explicit review prompts.
- If a required check cannot run, document the reason and remaining risk.

## Default Verify Contract

The verify command should answer:

```text
Is the project currently safe enough to accept this change?
```

As the stack matures, verify should include the relevant checks:

- format check
- lint
- typecheck
- unit tests
- integration tests
- build
- migration or schema checks
- security or dependency checks
- end-to-end or browser checks when user workflows require them

Not every project needs every check. Use `TEST_MATRIX.md` to decide what is required.

## When To Add A New Check

Add or strengthen enforcement when:

- the same issue appears more than once
- a rule is important but easy to forget
- a manual review comment can be detected automatically
- a boundary in `ARCHITECTURE.md` is repeatedly violated
- a security-sensitive behavior needs repeatable validation
- a bug fix needs a regression test

## CI Guidance

Once the project has CI, CI should run the same default verify command used locally.

Avoid separate local and CI-only truth when possible.
If CI needs extra checks, document them here and keep `harness/scripts/verify` as the local baseline.

## Enforcement Log

Record durable enforcement decisions in `docs/decisions/`.

Use this section only for short notes that do not justify a full decision record.

-
