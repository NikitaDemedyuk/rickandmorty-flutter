import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'characters_bloc.freezed.dart';
part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  new(this._repository) : super(CharactersState.initial()) {
    on<CharactersQueryChanged>(
      _onQueryChanged,
      transformer: _debounceRestartable(searchDebounce),
    );
    on<CharactersNextPageRequested>(
      _onNextPageRequested,
      transformer: droppable(),
    );
    on<CharactersRefreshRequested>(
      _onRefreshRequested,
      transformer: restartable(),
    );
  }

  static const Duration searchDebounce = Duration(milliseconds: 400);

  final CharactersRepository _repository;

  /// Completing it cancels the request currently in flight.
  Completer<void>? _cancelInFlight;

  Future<void> _onQueryChanged(
    CharactersQueryChanged event,
    Emitter<CharactersState> emit,
  ) async {
    final query = event.query.trim();
    if (query == state.query) return;
    emit(CharactersState(query: query, paging: PagingState(isLoading: true)));
    // Fetched here rather than through the list's `fetchNextPage`: that
    // request could be dropped while a stale next page is still in flight.
    await _fetchPage(1, emit);
  }

  Future<void> _onNextPageRequested(
    CharactersNextPageRequested event,
    Emitter<CharactersState> emit,
  ) async {
    final paging = state.paging;
    // The list also asks while the first page of a new query is loading.
    if (paging.isLoading || !paging.hasNextPage) return;
    emit(state.copyWith(paging: paging.copyWith(isLoading: true, error: null)));
    await _fetchPage(paging.nextIntPageKey, emit);
  }

  Future<void> _onRefreshRequested(
    CharactersRefreshRequested event,
    Emitter<CharactersState> emit,
  ) async {
    // Keeps the current items on screen until the fresh page arrives.
    emit(
      state.copyWith(
        paging: state.paging.copyWith(isLoading: true, error: null),
      ),
    );
    await _fetchPage(1, emit);
  }

  /// Loads [page] of the current query on top of the current paging state;
  /// page 1 replaces the list.
  Future<void> _fetchPage(int page, Emitter<CharactersState> emit) async {
    _cancelInFlight?.complete();
    final cancel = _cancelInFlight = Completer<void>();
    final requested = state.paging;

    final result = await _repository.getCharacters(
      page: page,
      name: state.query,
      cancelSignal: cancel.future,
    );

    if (identical(_cancelInFlight, cancel)) _cancelInFlight = null;
    // Stale guard: a new query or a refresh replaced the list meanwhile
    // (this also discards the cancelled request's UnknownFailure).
    if (!identical(state.paging, requested)) return;

    final base = page == 1 ? PagingState<int, Character>() : requested;
    emit(
      state.copyWith(
        paging: switch (result) {
          Ok(:final value) => base.copyWith(
            pages: [...?base.pages, value.characters],
            keys: [...?base.keys, page],
            hasNextPage: value.hasNext,
            isLoading: false,
          ),
          Err(:final failure) => base.copyWith(
            error: failure,
            isLoading: false,
          ),
        },
      ),
    );
  }

  @override
  Future<void> close() {
    _cancelInFlight?.complete();
    return super.close();
  }
}

/// Waits for [duration] of quiet, then cancels the previous handler.
EventTransformer<E> _debounceRestartable<E>(Duration duration) {
  final restart = restartable<E>();
  return (events, mapper) => restart(events.debounce(duration), mapper);
}
