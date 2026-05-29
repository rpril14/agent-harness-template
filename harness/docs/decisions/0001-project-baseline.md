# 0001 Project Baseline

## Status

Proposed

## Context

This repository starts with a reusable harness v0 for greenfield, agent-assisted development.

## Decision

Use the harness files at the repository root as the system of record for product intent, architecture, glossary, testing expectations, security rules, and execution plans.

## Consequences

- Agents have a stable map before the application stack is scaffolded.
- Project-specific decisions should be added to `docs/decisions/`.
- The harness should stay small until real project needs justify more structure.
