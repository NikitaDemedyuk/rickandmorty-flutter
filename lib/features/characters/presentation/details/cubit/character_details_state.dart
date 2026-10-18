part of 'character_details_cubit.dart';

@freezed
sealed class CharacterDetailsState with _$CharacterDetailsState {
  const factory loading() = CharacterDetailsLoading;

  const factory loaded(Character character) = CharacterDetailsLoaded;

  /// The UI maps it to a localized message.
  const factory failure(Failure failure) = CharacterDetailsFailure;
}
