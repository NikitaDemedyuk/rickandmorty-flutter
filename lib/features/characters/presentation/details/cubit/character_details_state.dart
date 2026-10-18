part of 'character_details_cubit.dart';

@freezed
sealed class CharacterDetailsState with _$CharacterDetailsState {
  /// Before the first [CharacterDetailsCubit.load]; shown as loading.
  const factory initial() = CharacterDetailsInitial;

  /// A request is in flight.
  const factory loadInProgress() = CharacterDetailsLoadInProgress;

  const factory loadSuccess(Character character) = CharacterDetailsLoadSuccess;

  /// The UI maps it to a localized message.
  const factory loadFailure(Failure failure) = CharacterDetailsLoadFailure;
}
