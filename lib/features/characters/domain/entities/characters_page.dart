import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';

part 'characters_page.freezed.dart';

/// One page of characters. Pages are 1-based; request `page + 1` while
/// [hasNext] is true.
@freezed
abstract class CharactersPage with _$CharactersPage {
  const factory({required List<Character> characters, required bool hasNext}) =
      _CharactersPage;

  static const CharactersPage empty = CharactersPage(
    characters: [],
    hasNext: false,
  );
}
