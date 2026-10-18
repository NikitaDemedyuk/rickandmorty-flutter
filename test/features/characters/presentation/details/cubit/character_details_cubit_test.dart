import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/presentation/details/cubit/character_details_cubit.dart';

import '../../../../../helpers/characters.dart';
import '../../../../../helpers/mock_characters_repository.dart';

void main() {
  late MockCharactersRepository repository;
  late CharacterDetailsCubit cubit;
  late List<CharacterDetailsState> states;

  setUp(() {
    repository = MockCharactersRepository();
    cubit = CharacterDetailsCubit(repository, id: 1);
    states = [];
    final subscription = cubit.stream.listen(states.add);
    addTearDown(() async {
      await subscription.cancel();
      await cubit.close();
    });
  });

  /// Lets the cubit's broadcast stream deliver what it emitted.
  Future<void> settle() => pumpEventQueue();

  test('starts initial and requests nothing until load()', () {
    expect(cubit.state, isA<CharacterDetailsInitial>());
    verifyZeroInteractions(repository);
  });

  test('emits the fetched character', () async {
    repository.stubCharacter(1, Ok(character(1)));

    await cubit.load();
    await settle();

    expect(states, [
      const CharacterDetailsLoading(),
      CharacterDetailsLoaded(character(1)),
    ]);
  });

  test('emits the failure', () async {
    repository.stubCharacter(1, const Err(NetworkFailure()));

    await cubit.load();
    await settle();

    expect(states, [
      const CharacterDetailsLoading(),
      const CharacterDetailsFailure(NetworkFailure()),
    ]);
  });

  test('a retry after a failure loads again', () async {
    repository.stubCharacter(1, const Err(NetworkFailure()));
    await cubit.load();
    repository.stubCharacter(1, Ok(character(1)));

    await cubit.load();
    await settle();

    expect(states, [
      const CharacterDetailsLoading(),
      const CharacterDetailsFailure(NetworkFailure()),
      const CharacterDetailsLoading(),
      CharacterDetailsLoaded(character(1)),
    ]);
  });

  test('ignores load() while a request is in flight', () async {
    final response = Completer<Result<Character>>();
    when(() => repository.getCharacter(1)).thenAnswer((_) => response.future);

    final first = cubit.load();
    final second = cubit.load();
    response.complete(Ok(character(1)));
    await Future.wait([first, second]);
    await settle();

    verify(() => repository.getCharacter(1)).called(1);
    expect(states, [
      const CharacterDetailsLoading(),
      CharacterDetailsLoaded(character(1)),
    ]);
  });

  test('drops a response that arrives after close()', () async {
    final response = Completer<Result<Character>>();
    when(() => repository.getCharacter(1)).thenAnswer((_) => response.future);

    final load = cubit.load();
    await cubit.close();
    response.complete(Ok(character(1)));

    await expectLater(load, completes);
    expect(states, [const CharacterDetailsLoading()]);
  });
}
