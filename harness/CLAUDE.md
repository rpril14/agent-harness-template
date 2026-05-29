# Claude Harness Instructions

This repository uses a lightweight harness for Claude Code-assisted greenfield development.
Treat this file as the map, not the manual.

## Read First

Before making changes, read the relevant files:

- `PRODUCT.md` for product intent and target users.
- `ARCHITECTURE.md` for structure, boundaries, and dependency rules.
- `GLOSSARY.md` for domain language.
- `TEST_MATRIX.md` for required checks by change type.
- `ENFORCEMENT.md` for machine-checkable rules, verify policy, and CI expectations.
- `SECURITY.md` before touching auth, permissions, secrets, external input, storage, or integrations.
- `PLANS.md` when work needs an execution plan.
- `docs/prompt-recipes.md` when the user asks how to start, plan, implement, verify, or harden work.

## Working Rules

- Prefer small, focused changes with clear verification.
- Do not invent product requirements. If the request is ambiguous, update the relevant intake or plan with assumptions.
- Keep repository knowledge in versioned files, not only in chat.
- When a repeated mistake appears, improve the harness: docs, tests, scripts, or lint rules.
- When a rule is repeatedly violated, consider promoting it into enforcement using `ENFORCEMENT.md`.
- Follow existing project conventions once the application stack is scaffolded.

## Planning

Use an execution plan for complex features, significant refactors, architecture changes, data model changes, security-sensitive work, or tasks expected to take multiple steps.

Plan files belong in:

- `docs/plans/active/` while in progress.
- `docs/plans/completed/` after completion.

Use `PLANS.md` as the plan policy reference and `templates/execution-plan.md` as the plan template.

## Verification

Run the relevant checks before declaring work complete.

Default command:

```sh
./harness/scripts/verify
```

On Windows PowerShell, run:

```powershell
./harness/scripts/verify.ps1
```

If the project stack uses a platform-specific command, update `harness/scripts/verify` and `harness/scripts/verify.ps1` so these commands remain the default entrypoints.

## Definition Of Done

A task is done when:

- The requested behavior is implemented.
- Relevant docs, glossary terms, or decisions are updated.
- Required checks from `TEST_MATRIX.md` have been run or a reason is recorded.
- Security-sensitive changes have been checked against `SECURITY.md`.
- Any remaining gaps are listed clearly.
