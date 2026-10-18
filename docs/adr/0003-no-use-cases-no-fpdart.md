# 3. No use cases, no fpdart

- **Status:** Accepted
- **Date:** 2026-10-18

## Context

Clean Architecture templates often add a use-case class per operation and model errors with `Either` from `fpdart`. This app has two operations, "get a page of characters" and "get a character by id". Neither has business logic beyond what the repository already does: trim the query, map a 404 on search to an empty page, and map DTOs to entities.

## Decision

- No use-case layer. Blocs and Cubits depend on the `CharactersRepository` interface from `domain/`.
- No `fpdart`. Repositories return a Dart 3 `sealed class Result<T>` with two variants, `Ok<T>` and `Err<T>` (holding a sealed `Failure`). Callers handle it with an exhaustive `switch`.
  - The variants are not named `Success`/`Error`: `Error` would shadow `dart:core`'s `Error`, and `Failure` is already the domain error type.

## Consequences

- Fewer files and no pass-through classes that would only forward one call. The domain layer still exists (entities and repository contracts), so presentation never sees DTOs or Dio.
- Exhaustive `switch` over sealed types gives the compile-time checks `Either` would give, with plain language features and no new dependency.
- If an operation gains real logic, for example combining two repositories, a use case can be added for it alone without touching the rest.
