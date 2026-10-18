import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/error/failure_message.dart';
import 'package:rickandmorty/core/widgets/empty_view.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/presentation/list/bloc/characters_bloc.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/character_tile.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/list_footers.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/search_field.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// Searchable, infinitely scrolled characters list. Expects a
/// [CharactersBloc] above it.
class CharactersListPage extends StatefulWidget {
  const new({required this.cacheManager, super.key});

  final BaseCacheManager cacheManager;

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _requestNextPage() =>
      context.read<CharactersBloc>().add(const CharactersNextPageRequested());

  /// Completes when the refreshed page has arrived (or failed).
  Future<void> _refresh() {
    final bloc = context.read<CharactersBloc>();
    final done = bloc.stream.firstWhere(
      (state) => !state.paging.isLoading,
      orElse: () => bloc.state,
    );
    bloc.add(const CharactersRefreshRequested());
    return done;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: SearchField(
              controller: _searchController,
              onChanged: (query) => context.read<CharactersBloc>().add(
                CharactersQueryChanged(query),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: BlocBuilder<CharactersBloc, CharactersState>(
                builder: (context, state) => PagedListView<int, Character>(
                  key: const PageStorageKey('characters-list'),
                  state: state.paging,
                  fetchNextPage: _requestNextPage,
                  // Lets pull-to-refresh work on the empty and error views.
                  physics: const AlwaysScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  // Every indicator is overridden: the package defaults use
                  // legacy Material and hard-coded English.
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, character, index) => CharacterTile(
                      character: character,
                      cacheManager: widget.cacheManager,
                    ),
                    firstPageProgressIndicatorBuilder: (_) =>
                        const LoadingView(),
                    // The error builders only run while paging.error is set.
                    firstPageErrorIndicatorBuilder: (context) => ErrorView(
                      message: failureMessage(context, state.failure!),
                      onRetry: _requestNextPage,
                    ),
                    noItemsFoundIndicatorBuilder: (context) =>
                        EmptyView(message: context.l10n.emptyResults),
                    newPageProgressIndicatorBuilder: (_) =>
                        const NextPageLoadingFooter(),
                    newPageErrorIndicatorBuilder: (context) =>
                        NextPageErrorFooter(
                          message: failureMessage(context, state.failure!),
                          onRetry: _requestNextPage,
                        ),
                    noMoreItemsIndicatorBuilder: (_) => const EndOfListFooter(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
