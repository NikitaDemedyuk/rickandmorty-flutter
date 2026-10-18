import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/error/failure_message.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/presentation/details/cubit/character_details_cubit.dart';
import 'package:rickandmorty/features/characters/presentation/details/widgets/character_facts.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/status_chip.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// A character's portrait, status and facts. Expects a
/// [CharacterDetailsCubit] above it.
class CharacterDetailsPage extends StatelessWidget {
  const new({required this.cacheManager, super.key});

  final BaseCacheManager cacheManager;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: switch (state) {
            CharacterDetailsLoaded(:final character) => Text(character.name),
            _ => null,
          },
        ),
        body: switch (state) {
          CharacterDetailsLoading() => const LoadingView(),
          // Retrying an id the API doesn't know can't help; Back is there.
          CharacterDetailsFailure(failure: NotFoundFailure()) => ErrorView(
            message: context.l10n.characterNotFound,
          ),
          CharacterDetailsFailure(:final failure) => ErrorView(
            message: failureMessage(context, failure),
            onRetry: context.read<CharacterDetailsCubit>().load,
          ),
          CharacterDetailsLoaded(:final character) => _CharacterDetails(
            character: character,
            cacheManager: cacheManager,
          ),
        },
      ),
    );
  }
}

class _CharacterDetails extends StatelessWidget {
  const new({required this.character, required this.cacheManager});

  final Character character;
  final BaseCacheManager cacheManager;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        // Keeps the portrait and facts readable in landscape and on tablets.
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: CharacterImage(
                    character: character,
                    cacheManager: cacheManager,
                  ),
                ),
              ),
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
        ),
      ),
    );
  }
}
