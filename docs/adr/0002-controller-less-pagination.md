# 2. Controller-less pagination

- **Status:** Accepted
- **Date:** 2026-10-18

## Context

`infinite_scroll_pagination` used to need a `PagingController`, which keeps its own pages, loading flag and error. Using it next to a Bloc means two sources of truth that have to be kept in sync by hand. That breaks easily when a search replaces the pages while a next-page request is still in flight.

Version 5 adds a controller-less mode: `PagedListView(state:, fetchNextPage:)` renders a `PagingState` value it is given.

## Decision

- `CharactersState` holds the query and a `PagingState<int, Character>`. The Bloc is the only code that changes it.
- `PagedListView` gets `state.paging` from a `BlocBuilder`, and its `fetchNextPage` adds `CharactersNextPageRequested`.
- The list overrides every indicator builder (first-page loader/error, empty, next-page loader/error, end of list). The package's defaults use legacy Material and hard-coded English.

## Consequences

- One source of truth. Bloc tests check the paging state directly, and widget tests pump a mocked Bloc in any `PagingState`.
- The Bloc has to keep the `PagingState` invariants itself: append pages, set `hasNextPage` from `info.next`, keep loaded items when a load fails.
- We depend on an API that is relatively new in a package with infrequent releases. If it stalls, `PagedListView` can be replaced by a `ListView` that reads the same state.
