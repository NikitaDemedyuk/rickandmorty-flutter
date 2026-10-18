import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/features/characters/presentation/details/character_details_page.dart';
import 'package:rickandmorty/features/characters/presentation/details/cubit/character_details_cubit.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/status_chip.dart';

import '../../../../helpers/characters.dart';
import '../../../../helpers/fake_cache_manager.dart';
import '../../../../helpers/pump_app.dart';

class _MockCubit extends Mock implements CharacterDetailsCubit;

void main() {
  late _MockCubit cubit;
  late FakeCacheManager cacheManager;

  setUp(() {
    cubit = _MockCubit();
    cacheManager = FakeCacheManager();
    when(() => cubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => cubit.id).thenReturn(1);
  });

  Future<void> pumpWithState(
    WidgetTester tester,
    CharacterDetailsState state, {
    String? imageUrl,
  }) async {
    when(() => cubit.state).thenReturn(state);
    await tester.pumpApp(
      BlocProvider<CharacterDetailsCubit>.value(
        value: cubit,
        child: CharacterDetailsPage(
          imageUrl: imageUrl,
          cacheManager: cacheManager,
        ),
      ),
    );
  }

  testWidgets('shows a loader before the first load', (tester) async {
    await pumpWithState(tester, const CharacterDetailsInitial());

    expect(find.byType(LoadingView), findsOneWidget);
  });

  group('while fetching', () {
    testWidgets('shows only a loader without a handed-over portrait', (
      tester,
    ) async {
      await pumpWithState(tester, const CharacterDetailsLoadInProgress());

      expect(find.byType(LoadingView), findsOneWidget);
      expect(find.byType(CharacterImage), findsNothing);
    });

    testWidgets('shows the handed-over portrait above a loader', (
      tester,
    ) async {
      final url = character(1).imageUrl;
      await pumpWithState(
        tester,
        const CharacterDetailsLoadInProgress(),
        imageUrl: url,
      );

      final image = tester.widget<CharacterImage>(find.byType(CharacterImage));
      expect(image.characterId, 1);
      expect(image.imageUrl, url);
      expect(find.byType(LoadingView), findsOneWidget);
      expect(find.byType(StatusChip), findsNothing);
    });
  });

  testWidgets('shows the portrait, name, status and facts', (tester) async {
    final rick = character(
      1,
      status: CharacterStatus.dead,
    ).copyWith(originName: 'Earth (C-137)', locationName: 'Citadel of Ricks');
    await pumpWithState(tester, CharacterDetailsLoadSuccess(rick));

    // In the app bar and under the portrait.
    expect(find.text('Character 1'), findsNWidgets(2));
    expect(find.byType(StatusChip), findsOneWidget);
    expect(find.text('Dead'), findsOneWidget);
    expect(find.text('Species'), findsOneWidget);
    expect(find.text('Human'), findsOneWidget);
    expect(find.text('Origin'), findsOneWidget);
    expect(find.text('Earth (C-137)'), findsOneWidget);
    expect(find.text('Last known location'), findsOneWidget);
    expect(find.text('Citadel of Ricks'), findsOneWidget);

    final image = tester.widget<CharacterImage>(find.byType(CharacterImage));
    expect(image.characterId, 1);
    expect(image.imageUrl, rick.imageUrl);
    expect(image.cacheManager, same(cacheManager));
  });

  testWidgets('shows a placeholder for an unknown origin and location', (
    tester,
  ) async {
    await pumpWithState(tester, CharacterDetailsLoadSuccess(character(1)));

    expect(find.text('Unknown'), findsNWidgets(2));
  });

  testWidgets('shows the failure and retries', (tester) async {
    when(() => cubit.load()).thenAnswer((_) async {});
    await pumpWithState(
      tester,
      const CharacterDetailsLoadFailure(NetworkFailure()),
    );

    expect(find.byType(ErrorView), findsOneWidget);
    expect(
      find.text(
        "Can't reach the server. "
        'Check your internet connection and try again.',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Retry'));
    verify(() => cubit.load()).called(1);
  });

  testWidgets('shows the timeout message', (tester) async {
    await pumpWithState(
      tester,
      const CharacterDetailsLoadFailure(TimeoutFailure()),
    );

    expect(find.byType(ErrorView), findsOneWidget);
    expect(
      find.text('The request took too long. Please try again.'),
      findsOneWidget,
    );
  });

  testWidgets('says the character does not exist, without a retry', (
    tester,
  ) async {
    await pumpWithState(
      tester,
      const CharacterDetailsLoadFailure(NotFoundFailure()),
    );

    expect(find.text("This character doesn't exist."), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });
}
