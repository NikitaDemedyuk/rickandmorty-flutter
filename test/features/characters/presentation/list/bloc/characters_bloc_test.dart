import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/entities/characters_page.dart';
import 'package:rickandmorty/features/characters/presentation/list/bloc/characters_bloc.dart';

import '../../../../../helpers/characters.dart';
import '../../../../../helpers/mock_characters_repository.dart';

/// A request held open until the test completes it; records cancellation.
final class _PendingRequest {
  final completer = Completer<Result<CharactersPage>>();
  bool cancelled = false;

  Future<Result<CharactersPage>> answer(Invocation invocation) {
    final signal = invocation.namedArguments[#cancelSignal] as Future<void>?;
    signal?.then((_) => cancelled = true).ignore();
    return completer.future;
  }
}

/// Expected paging state; page keys are 1-based and consecutive.
PagingState<int, Character> paging({
  List<List<int>>? pages,
  bool hasNextPage = true,
  bool isLoading = false,
  Failure? error,
}) => PagingState(
  pages: pages?.map((ids) => ids.map(character).toList()).toList(),
  keys: pages == null ? null : [for (var i = 1; i <= pages.length; i++) i],
  hasNextPage: hasNextPage,
  isLoading: isLoading,
  error: error,
);

CharactersState charactersState({
  String query = '',
  PagingState<int, Character>? paging,
}) => CharactersState(query: query, paging: paging ?? PagingState());

void main() {
  late MockCharactersRepository repository;

  setUp(() => repository = MockCharactersRepository());

  void stubPage(
    int page,
    Future<Result<CharactersPage>> Function(Invocation) answer, {
    String name = '',
  }) => when(
    () => repository.getCharacters(
      page: page,
      name: name,
      cancelSignal: any(named: 'cancelSignal'),
    ),
  ).thenAnswer(answer);

  void stubResult(
    int page,
    Result<CharactersPage> result, {
    String name = '',
  }) => stubPage(page, (_) async => result, name: name);

  void verifyFetched(int page, {String name = '', int times = 1}) => verify(
    () => repository.getCharacters(
      page: page,
      name: name,
      cancelSignal: any(named: 'cancelSignal'),
    ),
  ).called(times);

  /// Runs [body] in fake time against a bloc created inside the zone, so the
  /// search debounce uses fake timers. [states] collects every emission.
  void testBloc(
    String description,
    void Function(
      FakeAsync async,
      CharactersBloc bloc,
      List<CharactersState> states,
    )
    body,
  ) => test(
    description,
    () => fakeAsync((async) {
      final bloc = CharactersBloc(repository);
      final states = <CharactersState>[];
      final subscription = bloc.stream.listen(states.add);
      body(async, bloc, states);
      unawaited(subscription.cancel());
      unawaited(bloc.close());
      async.flushMicrotasks();
    }),
  );

  /// Loads the first page from the initial state and forgets those states.
  void loadFirstPage(
    FakeAsync async,
    CharactersBloc bloc,
    List<CharactersState> states,
    List<int> ids, {
    bool hasNext = true,
  }) {
    stubResult(1, Ok(charactersPage(ids, hasNext: hasNext)));
    bloc.add(const CharactersNextPageRequested());
    async.flushMicrotasks();
    states.clear();
  }

  void search(FakeAsync async, CharactersBloc bloc, String query) {
    bloc.add(CharactersQueryChanged(query));
    async
      ..elapse(CharactersBloc.searchDebounce)
      ..flushMicrotasks();
  }

  test('starts with no query and nothing loaded', () {
    final bloc = CharactersBloc(repository);
    addTearDown(bloc.close);

    expect(bloc.state, charactersState());
    expect(bloc.state.paging.status, PagingStatus.loadingFirstPage);
  });

  group('next page', () {
    testBloc('loads the first page', (async, bloc, states) {
      stubResult(1, Ok(charactersPage([1, 2])));

      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();

      expect(states, [
        charactersState(paging: paging(isLoading: true)),
        charactersState(
          paging: paging(
            pages: [
              [1, 2],
            ],
          ),
        ),
      ]);
      verifyFetched(1);
    });

    testBloc('appends the next page', (async, bloc, states) {
      loadFirstPage(async, bloc, states, [1, 2]);
      stubResult(2, Ok(charactersPage([3, 4])));

      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();

      expect(states, [
        charactersState(
          paging: paging(
            pages: [
              [1, 2],
            ],
            isLoading: true,
          ),
        ),
        charactersState(
          paging: paging(
            pages: [
              [1, 2],
              [3, 4],
            ],
          ),
        ),
      ]);
      verifyFetched(2);
    });

    testBloc('stops after the last page', (async, bloc, states) {
      loadFirstPage(async, bloc, states, [1], hasNext: false);
      expect(bloc.state.paging.status, PagingStatus.completed);

      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();

      expect(states, isEmpty);
      verifyNever(
        () => repository.getCharacters(
          page: 2,
          name: any(named: 'name'),
          cancelSignal: any(named: 'cancelSignal'),
        ),
      );
    });

    testBloc('ignores requests while a page is loading', (async, bloc, states) {
      final request = _PendingRequest();
      stubPage(1, request.answer);

      bloc
        ..add(const CharactersNextPageRequested())
        ..add(const CharactersNextPageRequested());
      async.flushMicrotasks();
      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();
      request.completer.complete(Ok(charactersPage([1])));
      async.flushMicrotasks();

      verifyFetched(1);
      expect(
        bloc.state,
        charactersState(
          paging: paging(
            pages: [
              [1],
            ],
          ),
        ),
      );
    });

    testBloc('keeps a first-page failure and retries page 1', (
      async,
      bloc,
      states,
    ) {
      stubResult(1, const Err(NetworkFailure()));

      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();

      expect(
        states.last,
        charactersState(paging: paging(error: const NetworkFailure())),
      );
      expect(bloc.state.paging.status, PagingStatus.firstPageError);
      expect(bloc.state.failure, const NetworkFailure());

      states.clear();
      stubResult(1, Ok(charactersPage([1])));
      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();

      expect(states, [
        charactersState(paging: paging(isLoading: true)),
        charactersState(
          paging: paging(
            pages: [
              [1],
            ],
          ),
        ),
      ]);
      verifyFetched(1, times: 2);
    });

    testBloc('keeps the items on a next-page failure and retries that page', (
      async,
      bloc,
      states,
    ) {
      loadFirstPage(async, bloc, states, [1, 2]);
      stubResult(2, const Err(ServerFailure(500)));

      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();

      expect(
        states.last,
        charactersState(
          paging: paging(
            pages: [
              [1, 2],
            ],
            error: const ServerFailure(500),
          ),
        ),
      );
      expect(bloc.state.paging.status, PagingStatus.subsequentPageError);

      stubResult(2, Ok(charactersPage([3], hasNext: false)));
      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();

      expect(
        bloc.state,
        charactersState(
          paging: paging(
            pages: [
              [1, 2],
              [3],
            ],
            hasNextPage: false,
          ),
        ),
      );
      verifyFetched(2, times: 2);
    });
  });

  group('query', () {
    testBloc('debounces and fetches only the latest trimmed query', (
      async,
      bloc,
      states,
    ) {
      stubResult(1, Ok(charactersPage([1])), name: 'rick');

      bloc
        ..add(const CharactersQueryChanged('r'))
        ..add(const CharactersQueryChanged('ri'));
      async.elapse(const Duration(milliseconds: 300));
      bloc.add(const CharactersQueryChanged(' rick '));
      async.elapse(
        CharactersBloc.searchDebounce - const Duration(milliseconds: 1),
      );

      expect(states, isEmpty);
      verifyZeroInteractions(repository);

      async
        ..elapse(const Duration(milliseconds: 1))
        ..flushMicrotasks();

      expect(states, [
        charactersState(query: 'rick', paging: paging(isLoading: true)),
        charactersState(
          query: 'rick',
          paging: paging(
            pages: [
              [1],
            ],
          ),
        ),
      ]);
      verifyFetched(1, name: 'rick');
      verifyNoMoreInteractions(repository);
    });

    testBloc('replaces the loaded list with the first page of the new query', (
      async,
      bloc,
      states,
    ) {
      loadFirstPage(async, bloc, states, [1, 2]);
      stubResult(1, Ok(charactersPage([7])), name: 'rick');

      search(async, bloc, 'rick');

      expect(
        bloc.state,
        charactersState(
          query: 'rick',
          paging: paging(
            pages: [
              [7],
            ],
          ),
        ),
      );
    });

    testBloc('ignores a query equal to the current one once trimmed', (
      async,
      bloc,
      states,
    ) {
      search(async, bloc, '   ');

      expect(states, isEmpty);
      verifyZeroInteractions(repository);
    });

    testBloc('shows no items for a search without matches', (
      async,
      bloc,
      states,
    ) {
      stubResult(1, const Ok(CharactersPage.empty), name: 'zzz');

      search(async, bloc, 'zzz');

      expect(bloc.state.paging.status, PagingStatus.noItemsFound);
    });

    testBloc('discards a next page that arrives after the query changed', (
      async,
      bloc,
      states,
    ) {
      loadFirstPage(async, bloc, states, [1, 2]);
      final stale = _PendingRequest();
      stubPage(2, stale.answer);
      stubResult(1, Ok(charactersPage([7])), name: 'rick');

      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();
      search(async, bloc, 'rick');
      stale.completer.complete(Ok(charactersPage([3, 4])));
      async.flushMicrotasks();

      expect(stale.cancelled, isTrue);
      expect(
        bloc.state,
        charactersState(
          query: 'rick',
          paging: paging(
            pages: [
              [7],
            ],
          ),
        ),
      );
    });

    testBloc('cancels and discards the previous query', (async, bloc, states) {
      final stale = _PendingRequest();
      stubPage(1, stale.answer, name: 'morty');
      stubResult(1, Ok(charactersPage([7])), name: 'rick');

      search(async, bloc, 'morty');
      search(async, bloc, 'rick');
      stale.completer.complete(Ok(charactersPage([1])));
      async.flushMicrotasks();

      expect(stale.cancelled, isTrue);
      expect(
        bloc.state,
        charactersState(
          query: 'rick',
          paging: paging(
            pages: [
              [7],
            ],
          ),
        ),
      );
    });
  });

  group('refresh', () {
    testBloc('keeps the items while loading, then replaces them', (
      async,
      bloc,
      states,
    ) {
      loadFirstPage(async, bloc, states, [1, 2]);
      stubResult(2, Ok(charactersPage([3, 4])));
      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();
      states.clear();
      stubResult(1, Ok(charactersPage([5, 6])));

      bloc.add(const CharactersRefreshRequested());
      async.flushMicrotasks();

      expect(states, [
        charactersState(
          paging: paging(
            pages: [
              [1, 2],
              [3, 4],
            ],
            isLoading: true,
          ),
        ),
        charactersState(
          paging: paging(
            pages: [
              [5, 6],
            ],
          ),
        ),
      ]);
    });

    testBloc('keeps the items and the failure when it fails', (
      async,
      bloc,
      states,
    ) {
      loadFirstPage(async, bloc, states, [1, 2]);
      stubResult(1, const Err(NetworkFailure()));

      bloc.add(const CharactersRefreshRequested());
      async.flushMicrotasks();

      expect(
        bloc.state,
        charactersState(
          paging: paging(
            pages: [
              [1, 2],
            ],
            error: const NetworkFailure(),
          ),
        ),
      );
      expect(bloc.state.paging.status, PagingStatus.subsequentPageError);
    });

    testBloc('cancels and discards a next page in flight', (
      async,
      bloc,
      states,
    ) {
      loadFirstPage(async, bloc, states, [1, 2]);
      final stale = _PendingRequest();
      stubPage(2, stale.answer);

      bloc.add(const CharactersNextPageRequested());
      async.flushMicrotasks();
      stubResult(1, Ok(charactersPage([5])));
      bloc.add(const CharactersRefreshRequested());
      async.flushMicrotasks();
      stale.completer.complete(const Err(UnknownFailure()));
      async.flushMicrotasks();

      expect(stale.cancelled, isTrue);
      expect(
        bloc.state,
        charactersState(
          paging: paging(
            pages: [
              [5],
            ],
          ),
        ),
      );
    });
  });

  test('close cancels the request in flight', () async {
    final request = _PendingRequest();
    stubPage(1, request.answer);
    final bloc = CharactersBloc(repository)
      ..add(const CharactersNextPageRequested());
    await Future<void>.delayed(Duration.zero);

    final closed = bloc.close();
    await Future<void>.delayed(Duration.zero);

    expect(request.cancelled, isTrue);
    request.completer.complete(const Err(UnknownFailure()));
    await closed;
  });
}
