import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';
import 'package:rickandmorty/features/characters/presentation/details/character_details_page.dart';
import 'package:rickandmorty/features/characters/presentation/details/cubit/character_details_cubit.dart';
import 'package:rickandmorty/features/characters/presentation/list/bloc/characters_bloc.dart';
import 'package:rickandmorty/features/characters/presentation/list/characters_list_page.dart';
import 'package:rickandmorty/l10n/l10n.dart';

abstract final class AppRoutes {
  static const String home = '/';

  static String character(int id) => '/character/$id';
}

/// Route builders resolve their dependencies from [getIt], so tests can pass
/// an isolated container instead of the global [GetIt.instance].
GoRouter createRouter({
  required GetIt getIt,
  String initialLocation = AppRoutes.home,
}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      // The bloc lives on the list route, so pushing details keeps its state.
      builder: (context, _) => BlocProvider(
        create: (_) => CharactersBloc(getIt<CharactersRepository>()),
        child: CharactersListPage(
          cacheManager: getIt<BaseCacheManager>(),
          onCharacterTap: (character) =>
              context.push(AppRoutes.character(character.id)),
        ),
      ),
      routes: [
        // Nested, so a deep link still has the list to go back to.
        GoRoute(
          path: 'character/:id',
          builder: (_, state) {
            final id = int.tryParse(state.pathParameters['id']!);
            if (id == null) return const _NotFoundPage();
            // Only the id travels: the page always fetches what it shows.
            return BlocProvider(
              create: (_) {
                final cubit = CharacterDetailsCubit(
                  getIt<CharactersRepository>(),
                  id: id,
                );
                unawaited(cubit.load());
                return cubit;
              },
              child: CharacterDetailsPage(
                cacheManager: getIt<BaseCacheManager>(),
              ),
            );
          },
        ),
      ],
    ),
  ],
  errorBuilder: (_, _) => const _NotFoundPage(),
);

class _NotFoundPage extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ErrorView(
        message: context.l10n.pageNotFound,
        onRetry: () => context.go(AppRoutes.home),
        actionLabel: context.l10n.goHome,
      ),
    );
  }
}
