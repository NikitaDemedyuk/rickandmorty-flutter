part of 'character_details_cubit.dart';

@freezed
sealed class CharacterDetailsState with _$CharacterDetailsState {
  /// Before the first [CharacterDetailsCubit.load]; shown as loading.
  const factory initial() = CharacterDetailsInitial;

  /// A request is in flight.
  const factory loading() = CharacterDetailsLoading;

  const factory loaded(Character character) = CharacterDetailsLoaded;

  /// The UI maps it to a localized message.
  const factory failure(Failure failure) = CharacterDetailsFailure;
}
