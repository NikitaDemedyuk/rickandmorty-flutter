part of 'characters_bloc.dart';

@freezed
sealed class CharactersEvent with _$CharactersEvent {
  /// The search text changed; debounced, and only the latest query runs.
  const factory queryChanged(String query) = CharactersQueryChanged;

  /// The list needs the next page, or a failed page should be retried.
  const factory nextPageRequested() = CharactersNextPageRequested;

  /// Pull-to-refresh: reload the first page of the current query.
  const factory refreshRequested() = CharactersRefreshRequested;
}
