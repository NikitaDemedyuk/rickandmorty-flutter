import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/entities/characters_page.dart';

abstract interface class CharactersRepository {
  /// Fetches the 1-based [page], filtered by the trimmed [name] when it isn't
  /// blank.
  ///
  /// A search with no matches is an empty page, not a `NotFoundFailure`.
  ///
  /// Completing [cancelSignal] aborts the request; it then fails with an
  /// `UnknownFailure`.
  Future<Result<CharactersPage>> getCharacters({
    required int page,
    String? name,
    Future<void>? cancelSignal,
  });

  Future<Result<Character>> getCharacter(int id);
}
