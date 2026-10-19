part of 'character_details_cubit.dart';

@freezed
sealed class CharacterDetailsState with _$CharacterDetailsState {
  /// Before the first [CharacterDetailsCubit.load]; shown as loading.
  const factory initial() = CharacterDetailsInitial;

  const factory loadInProgress() = CharacterDetailsLoadInProgress;

  const factory loadSuccess(Character character) = CharacterDetailsLoadSuccess;

  const factory loadFailure(Failure failure) = CharacterDetailsLoadFailure;
}
