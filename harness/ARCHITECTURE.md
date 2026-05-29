# Architecture

## Intent

This file defines the architectural boundaries agents must preserve while building the project.
Keep it short, concrete, and updated as the stack becomes real.

## Stack

Record the chosen stack after project initialization.

- Runtime:
- Language:
- Framework:
- Package manager:
- Database:
- Test runner:
- Deployment target:

## System Shape

Describe the main application parts.

```text
user interface
application/service layer
domain logic
data access
external providers
```

## Dependency Rules

- Higher-level product code may depend on lower-level domain and data abstractions only through explicit interfaces.
- Domain logic must not depend on UI, transport, or framework-specific runtime details.
- External services must be wrapped behind provider or adapter modules.
- Data shapes from external input must be validated at system boundaries.
- Shared utilities should be boring, small, and well-tested.

## Module Boundaries

Define project-specific modules here once the scaffold exists.

| Module | Owns | May depend on | Must not depend on |
|---|---|---|---|
| TBD | TBD | TBD | TBD |

## Data Rules

- Validate untrusted input at the boundary.
- Keep persistence models separate from user-facing view models when they diverge.
- Record migrations and schema-impacting decisions in `docs/decisions/`.

## Operational Rules

- Startup must fail clearly when required configuration is missing.
- Logs should be structured once a logging system exists.
- Errors should preserve enough context to debug without leaking secrets.

## Architecture Checks

Until automated architecture checks exist, agents must manually compare changes against this file.
When a rule becomes important and repeatedly violated, promote it into a script, lint rule, structural check, or test.
Use `ENFORCEMENT.md` for the policy on turning architecture rules into machine-checkable checks.
