# Agent Harness Template

This repository is a lightweight harness template for greenfield, agent-assisted software projects.
It gives coding agents a stable project map before application code exists, while keeping the harness separate from application code.

## What This Template Is For

Use this template when starting a new project and you want coding agents to:

- Understand product intent before writing code.
- Follow explicit architecture boundaries.
- Use stable domain language.
- Choose the right verification checks for each change.
- Record decisions and plans inside the repository.
- Improve the harness when repeated mistakes appear.

This is not an application framework. It does not prescribe React, Next.js, FastAPI, Laravel, PostgreSQL, or any other stack.

The intended project shape is:

```text
harness/
  <project memory, templates, verification>

src/
  <application code>
```

## Template Structure

```text
CLAUDE.md

harness/
  CLAUDE.md
  PRODUCT.md
  ARCHITECTURE.md
  GLOSSARY.md
  TEST_MATRIX.md
  ENFORCEMENT.md
  SECURITY.md
  PLANS.md
  docs/
    README.md
    prompt-recipes.md
    product/
      user-flows.md
      acceptance-criteria.md
      <feature-slug>.md  (one per feature, created from templates/feature-intake.md)
    decisions/
      0001-project-baseline.md
    plans/
      active/
      completed/
    references/
  templates/
    decision-record.md
    execution-plan.md
    feature-intake.md
  scripts/
    verify
    verify.ps1

src/
  <application code>
```

## File Roles

Root `CLAUDE.md` is the entrypoint for Claude Code. It points into `harness/`.

`harness/CLAUDE.md` is the current agent adapter. Keep it short. It tells Claude Code which files to read, how to plan, and how to verify work.

Additional adapters for Codex or other agents can be added later without changing the harness memory structure.

`harness/PRODUCT.md` defines what the product is, who it serves, and what outcomes matter.

`harness/ARCHITECTURE.md` defines the system shape, dependency rules, data rules, and boundaries agents must preserve.

`harness/GLOSSARY.md` keeps domain terms stable across docs, UI, code, APIs, database names, and tests.

`harness/TEST_MATRIX.md` maps change types to required checks.

`harness/ENFORCEMENT.md` defines how rules become machine-checkable through verify scripts, tests, lint, CI, or structural checks.

`harness/SECURITY.md` defines baseline security rules and review prompts for sensitive changes.

`harness/PLANS.md` defines the policy for execution plans. Actual plans live in `harness/docs/plans/active/` and `harness/docs/plans/completed/`.

`harness/docs/` contains project memory. Start with `harness/docs/README.md`.

`harness/docs/prompt-recipes.md` contains reusable prompts for operating the harness without writing code by hand.

`harness/templates/` contains copyable document templates used during planning and memory updates.

`harness/scripts/verify` and `harness/scripts/verify.ps1` are the default verification entrypoints.

## How To Start A New Project

### Install

In an empty directory (or an existing project root):

```sh
curl -fsSL https://raw.githubusercontent.com/rpril14/agent-harness-template/main/install.sh | sh
```

To install into a named directory:

```sh
curl -fsSL https://raw.githubusercontent.com/rpril14/agent-harness-template/main/install.sh | sh -s -- my-project
```

The script downloads the template, copies files without overwriting anything that already exists, and prints next steps.

### Setup

1. Fill in `harness/PRODUCT.md`.
2. Add project-specific terms to `harness/GLOSSARY.md`.
3. Choose a stack and record it in `harness/docs/decisions/0001-project-baseline.md`.
4. Update the `Stack` section in `harness/ARCHITECTURE.md`.
5. Ask the active coding agent to scaffold the project according to its adapter and `harness/ARCHITECTURE.md`.
6. Update `harness/scripts/verify` and `harness/scripts/verify.ps1` so they run the real project checks.
7. Run verification before accepting generated work.

## Recommended First Prompt

Use this before application code exists:

```text
Follow the repository harness in harness/.

Read CLAUDE.md, harness/CLAUDE.md, harness/PRODUCT.md, harness/ARCHITECTURE.md, harness/GLOSSARY.md, harness/TEST_MATRIX.md, harness/ENFORCEMENT.md, harness/SECURITY.md, and harness/PLANS.md.

Product idea:
<describe the product>

Do not scaffold application code yet.

First update the harness baseline:
- harness/PRODUCT.md
- harness/GLOSSARY.md
- harness/ARCHITECTURE.md
- harness/docs/decisions/0001-project-baseline.md

Capture product goal, target users, initial scope, out-of-scope items, proposed stack, key domain terms, assumptions, and open questions.
Stop after updating the baseline and summarize what needs human approval.
```

After approving the baseline, use `harness/docs/prompt-recipes.md` to scaffold the project, plan features, implement plans, verify work, and harden the harness.

## Feature Workflow

For small changes, describe the task directly and require verification from `harness/TEST_MATRIX.md`.

For larger changes:

1. Create a feature intake file in `harness/docs/product/` from `harness/templates/feature-intake.md`, named after the feature (e.g. `csv-export.md`).
2. Create an execution plan in `harness/docs/plans/active/` from `harness/templates/execution-plan.md`.
3. Implement according to the plan.
4. Run the checks from `harness/TEST_MATRIX.md`.
5. Move the plan to `harness/docs/plans/completed/` when finished.
6. Record any durable decision in `harness/docs/decisions/`.

## Verification

On Unix-like shells:

```sh
./harness/scripts/verify
```

On Windows PowerShell:

```powershell
./harness/scripts/verify.ps1
```

Before a stack is scaffolded, these scripts run harness integrity checks: required files present, active plans have acceptance criteria.
After choosing a stack, update them to also run format, lint, typecheck, test, and build checks.

## How To Evolve The Harness

Do not add process for its own sake.
Add structure only when it prevents repeated mistakes or makes agent work easier to verify.

Good reasons to update the harness:

- The agent repeatedly misunderstands a domain term.
- The agent violates the same architecture boundary more than once.
- A class of bugs needs a recurring test rule.
- A security rule should be checked every time.
- A repeated manual review comment can become a lint rule, script, or checklist.

Avoid adding broad documents that only restate good intentions.
Prefer concrete rules, examples, commands, and checks.
