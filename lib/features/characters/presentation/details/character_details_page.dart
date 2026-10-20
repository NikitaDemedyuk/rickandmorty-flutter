import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/error/failure_message.dart';
import 'package:rickandmorty/core/theme/spacing.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';
import 'package:rickandmorty/features/characters/presentation/details/cubit/character_details_cubit.dart';
import 'package:rickandmorty/features/characters/presentation/details/widgets/character_facts.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/status_chip.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// A character's portrait, status and facts. Expects a
/// [CharacterDetailsCubit] above it.
class CharacterDetailsPage extends StatelessWidget {
  const new({required this.cacheManager, this.imageUrl, super.key});

  final BaseCacheManager cacheManager;

  /// Portrait handed over by the list, shown while the character loads so
  /// the [Hero] has somewhere to fly on push. `null` for a deep link.
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    return BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: switch (state) {
            CharacterDetailsLoadSuccess(:final character) => Text(
              character.name,
            ),
            _ => null,
          },
        ),
        body: switch (state) {
          CharacterDetailsInitial() || CharacterDetailsLoadInProgress()
              when imageUrl != null =>
            _DetailsLayout(
              characterId: context.read<CharacterDetailsCubit>().id,
              imageUrl: imageUrl,
              cacheManager: cacheManager,
              children: const [
                Padding(
                  padding: EdgeInsets.all(Spacing.xl),
                  child: LoadingView(),
                ),
              ],
            ),
          CharacterDetailsInitial() ||
          CharacterDetailsLoadInProgress() => const LoadingView(),
          // Retrying an id the API doesn't know can't help; Back is there.
          CharacterDetailsLoadFailure(failure: NotFoundFailure()) => ErrorView(
            message: context.l10n.characterNotFound,
          ),
          CharacterDetailsLoadFailure(:final failure) => ErrorView(
            message: failureMessage(context, failure),
            onRetry: context.read<CharacterDetailsCubit>().load,
          ),
          CharacterDetailsLoadSuccess(:final character) => _DetailsLayout(
            characterId: character.id,
            imageUrl: character.imageUrl,
            cacheManager: cacheManager,
            children: [
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: Text(
                      character.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  StatusChip(status: character.status),
                ],
              ),
              CharacterFacts(character: character),
            ],
          ),
        },
      ),
    );
  }
}

/// The portrait with [children] below it. Loading and loaded share it, so the
/// portrait stays in place (and isn't reloaded) when the character arrives.
class _DetailsLayout extends StatelessWidget {
  const new({
    required this.characterId,
    required this.imageUrl,
    required this.cacheManager,
    required this.children,
  });

  final int characterId;
  final String imageUrl;
  final BaseCacheManager cacheManager;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Center(
        // Keeps the portrait and facts readable in landscape and on tablets.
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: Spacing.lg,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CharacterImage(
                  characterId: characterId,
                  imageUrl: imageUrl,
                  cacheManager: cacheManager,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                ),
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
