import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';

part 'character_details_cubit.freezed.dart';
part 'character_details_state.dart';

/// Loads the character with [id]; the route calls [load] once it is created.
class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  new(this._repository, {required this.id})
    : super(const CharacterDetailsLoading());

  final CharactersRepository _repository;
  final int id;

  bool _isLoading = false;

  /// Fetches the character; ignored while a fetch is already in flight
  /// (e.g. a double tap on Retry).
  Future<void> load() async {
    if (_isLoading) return;
    _isLoading = true;
    // Bloc dedupes equal states only after its first emit, so re-emitting the
    // initial `loading` would reach listeners.
    if (state is! CharacterDetailsLoading) {
      emit(const CharacterDetailsLoading());
    }
    final result = await _repository.getCharacter(id);
    _isLoading = false;
    // The user may have left the screen while the request was in flight.
    if (isClosed) return;
    emit(switch (result) {
      Ok(:final value) => CharacterDetailsLoaded(value),
      Err(:final failure) => CharacterDetailsFailure(failure),
    });
  }
}
