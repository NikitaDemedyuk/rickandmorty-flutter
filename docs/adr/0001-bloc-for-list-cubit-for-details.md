# 1. Bloc for the list, Cubit for details

- **Status:** Accepted
- **Date:** 2026-10-18

## Context

The list screen handles three streams of input that overlap in time. The user types a query, scrolling asks for the next page, and pull-to-refresh asks for page 1 again. Each needs its own concurrency policy:

- A search must wait until typing pauses, and a newer query must cancel the older one.
- Requests for the next page made while one is in flight must be ignored.
- A response that arrives after the query changed must be thrown away.

The details screen does one thing: load a character by id, with a retry.

## Decision

- `CharactersBloc` (a `Bloc`) drives the list. Each event declares its policy with a transformer:
  - `CharactersQueryChanged`: debounce 400 ms, then `restartable`.
  - `CharactersNextPageRequested`: `droppable`.
  - `CharactersRefreshRequested`: `restartable`.
- A stale-response guard keys on the request itself (the per-request cancel `Completer`), not on state equality.
- `CharacterDetailsCubit` (a `Cubit`) drives details. It has one `load()` method and a sealed state: `Initial`, `LoadInProgress`, `LoadSuccess`, `LoadFailure`.

## Consequences

- The concurrency rules for the list are written down next to the handlers, and tests check them with `fake_async`. Doing the same with `Timer`s and flags in a Cubit would be harder to read and to test.
- Details stay small, with no event classes for a single action.
- Readers need to know both APIs. The split follows a simple rule: use a Bloc when events need different concurrency policies, otherwise a Cubit.
