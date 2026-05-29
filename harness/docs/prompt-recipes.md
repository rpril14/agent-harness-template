# Prompt Recipes

Use these prompts to operate the harness without writing code by hand.
The human provides intent, reviews tradeoffs, and approves checkpoints.
The agent writes files, implements code, runs verification, and updates the harness.

## 1. Initialize Product

Use this before application code exists.

```text
Use the harness initialization workflow.

Read CLAUDE.md, harness/CLAUDE.md, harness/PRODUCT.md, harness/ARCHITECTURE.md, harness/GLOSSARY.md, harness/TEST_MATRIX.md, harness/ENFORCEMENT.md, harness/SECURITY.md, and harness/PLANS.md.

Product idea:
<describe the product>

Do not scaffold application code yet.

First update:
- harness/PRODUCT.md
- harness/GLOSSARY.md
- harness/ARCHITECTURE.md
- harness/docs/decisions/0001-project-baseline.md

Capture:
- product goal
- target users
- initial scope
- out-of-scope items
- chosen or proposed stack
- key domain terms
- major assumptions
- open questions

If a decision is missing, make a conservative recommendation and mark it as an assumption.
Stop after updating the harness baseline and summarize what needs human approval.
```

## 2. Scaffold Project

Use this after the baseline is approved.

```text
Scaffold the initial project using the current harness.

Read CLAUDE.md, harness/CLAUDE.md, harness/PRODUCT.md, harness/ARCHITECTURE.md, harness/GLOSSARY.md, harness/TEST_MATRIX.md, harness/ENFORCEMENT.md, harness/SECURITY.md, and harness/docs/decisions/0001-project-baseline.md.

Follow ARCHITECTURE.md.
Do not add features beyond harness/PRODUCT.md.

Create the initial project structure, configuration, test setup, and developer scripts.
Update harness/scripts/verify and harness/scripts/verify.ps1 so they run the project's real checks.

Run verification.
Report:
- what was created
- what checks passed
- what checks failed or could not run
- what decisions or assumptions were recorded
```

## 3. Plan Feature

Use this before implementing a non-trivial feature.

```text
Use the feature planning workflow.

Feature idea:
<describe the feature>

Read harness/PRODUCT.md, harness/ARCHITECTURE.md, harness/GLOSSARY.md, harness/TEST_MATRIX.md, harness/ENFORCEMENT.md, harness/SECURITY.md, and harness/PLANS.md.

Create or update a feature intake under harness/docs/product/ using harness/templates/feature-intake.md.
Create an execution plan in harness/docs/plans/active/ using harness/templates/execution-plan.md.

The plan must include:
- goal
- context
- scope
- acceptance criteria
- design
- implementation steps
- verification checks from TEST_MATRIX.md
- risks and rollback notes

Do not implement yet.
Stop when the plan is ready for human review.
```

## 4. Implement Active Plan

Use this after a plan is approved.

```text
Implement the active execution plan.

Read the plan in harness/docs/plans/active/ and the relevant harness files.
Follow ARCHITECTURE.md, TEST_MATRIX.md, SECURITY.md, and GLOSSARY.md.

Update code, tests, docs, and scripts as needed.
Run the relevant verification command.

When complete:
- update the plan progress and completion notes
- move the plan to harness/docs/plans/completed/
- record durable decisions in harness/docs/decisions/ using harness/templates/decision-record.md
- summarize verification results
- list any remaining risks or follow-up work
```

## 5. Fix Bug And Harden Harness

Use this when a bug appears or generated work misses the mark.

```text
Fix this issue:
<describe the issue, observed behavior, and expected behavior>

First reproduce or identify the failure path.
Then implement the smallest correct fix.

Add or update a regression test when practical.
Run verification.

After fixing, inspect whether this class of mistake should update:
- CLAUDE.md
- ARCHITECTURE.md
- GLOSSARY.md
- TEST_MATRIX.md
- ENFORCEMENT.md
- SECURITY.md
- harness/scripts/verify
- harness/scripts/verify.ps1

If yes, update the harness so the mistake is less likely to repeat.
Report the fix, verification result, and harness change.
```

## 6. Verify And Close

Use this before accepting a task as done.

```text
Verify the current work against the harness.

Read harness/TEST_MATRIX.md and the active or recently completed plan if one exists.
Run the relevant verification command.

Check:
- requested behavior is implemented
- acceptance criteria are satisfied
- relevant tests exist or the gap is documented
- security-sensitive changes follow SECURITY.md
- docs and decisions are updated

Report:
- verification commands run
- pass/fail result
- unresolved risks
- files changed for docs, tests, and implementation
```

## 7. Review Generated Work

Use this when you want a second-pass review before accepting agent output.

```text
Review the current changes as a senior engineer.

Focus on:
- behavioral bugs
- missing acceptance criteria
- architecture boundary violations
- security or privacy risks
- missing tests from TEST_MATRIX.md
- docs or decision records that should be updated

Do not rewrite code unless needed to fix a concrete issue.
List findings by severity with file references.
If there are no findings, say so and mention residual risks.
```

## 8. Update Harness From Lessons Learned

Use this after several tasks, bugs, or review comments.

```text
Review recent work and update the harness only where it prevents repeated mistakes.

Look for:
- ambiguous domain terms
- repeated architecture drift
- missing test expectations
- recurring security review gaps
- manual review comments that can become rules or checks

Update only the relevant harness files.
Avoid broad process text.
Prefer concrete rules, examples, commands, and checks.
```
