import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';

part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const factory({
    required int id,
    required String name,
    required String imageUrl,
    required CharacterStatus status,
    required String species,

    /// `null` when the API doesn't know it; the UI shows a placeholder.
    required String? originName,

    /// `null` when the API doesn't know it; the UI shows a placeholder.
    required String? locationName,
  }) = _Character;
}
