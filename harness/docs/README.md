# Harness Memory

This folder contains project memory that should survive beyond a single chat or task.

For harness-level rules, read the root files in `harness/`:

- `PRODUCT.md` for product intent.
- `ARCHITECTURE.md` for system boundaries.
- `GLOSSARY.md` for domain language.
- `TEST_MATRIX.md` for required checks.
- `ENFORCEMENT.md` for machine-checkable rules and verify policy.
- `SECURITY.md` for security expectations.
- `PLANS.md` for execution plan policy.

## Product

`product/` stores product-level context:

- Feature intake files (one per feature, named by slug) for non-trivial features.
- `user-flows.md` for important user workflows.
- `acceptance-criteria.md` for product-wide or feature-level acceptance criteria.

Use `../templates/feature-intake.md` when creating feature-specific intake files.

## Decisions

`decisions/` stores durable product and engineering decisions.

Create a decision record when work changes:

- technology stack
- architecture boundaries
- data model or storage strategy
- security posture
- external integrations
- deployment or operations approach
- product scope with long-term consequences

Use `../templates/decision-record.md` for new records.
Name records with a sortable number and short slug:

```text
0002-use-postgresql.md
0003-adopt-nextjs-app-router.md
```

## Plans

`plans/` stores execution plans.

- `plans/active/` contains plans currently being implemented.
- `plans/completed/` contains plans that have been finished.

Use `../templates/execution-plan.md` for new plans.
Move a plan from `active/` to `completed/` when implementation and verification are complete.

## References

`references/` stores source material, external notes, screenshots, research summaries, or other context the agent should consult.
