part of 'characters_bloc.dart';

@freezed
abstract class CharactersState with _$CharactersState {
  const factory({
    /// Trimmed search text; empty means no filter.
    required String query,

    /// Its `error` is always a [Failure]; read it through [failure].
    required PagingState<int, Character> paging,
  }) = _CharactersState;

  factory initial() => CharactersState(query: '', paging: PagingState());
}

extension CharactersStateX on CharactersState {
  Failure? get failure => paging.error as Failure?;
}
