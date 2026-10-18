import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/domain/entities/characters_page.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';

final class MockCharactersRepository extends Mock
    implements CharactersRepository {
  /// Answers every `getCharacters` call with [result], whatever the page,
  /// name or cancel signal.
  void stubAnyPage(Result<CharactersPage> result) => when(
    () => getCharacters(
      page: any(named: 'page'),
      name: any(named: 'name'),
      cancelSignal: any(named: 'cancelSignal'),
    ),
  ).thenAnswer((_) async => result);
}
