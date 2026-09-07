# Scrummy

This file maps this repository to a Scrummy project so the `scrummy` skill can sync code to the board without asking. Keep it short; the agent reads it at the start of every session in this repo.

- **Project:** `PAY` — Payments (Scrummy identifier; the agent resolves the id)
- **Workspace:** `acme` (only needed if the token reaches more than one)
- **Default branch:** `main`

## What done means here

Merged to `main` with CI green. Deployed is a separate state ("Released") that the release manager moves; the agent does not.

## Conventions

- Branch names carry the identifier: `feat/pay-42-short-slug`, `fix/pay-58-...`.
- Commit subjects start with the identifier when the work maps to an item: `PAY-42: handle gift card`.
- "Ready for review" is our review state; a PR opened moves the item there.
- Tests: `pnpm test` (unit), `pnpm test:e2e` (needs the local stack up; do not run it unprompted).
- Labels the team actually uses: `bug`, `infra`, `needs-design`. Sequencing lives in cycles, not labels.

## Where things live

- Decisions: as comments on the item, or the "Payments — Decisions" page for anything cross-cutting.
- Specs: linked on the item (Notion), not copied into the description.

## Do not

- Do not create items for chores under an hour; batch them in a comment on the cycle's housekeeping item.
- Do not move items to Released.
