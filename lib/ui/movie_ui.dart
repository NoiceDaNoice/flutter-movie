import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_db/service/bookmark_store.dart';
import '../app_localizations.dart';
import '../service/movie_store.dart';

class MovieUi extends StatelessWidget {
  final MovieStore movieStore;
  final BookmarkStore bookmarkStore;
  const MovieUi({
    super.key,
    required this.movieStore,
    required this.bookmarkStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).popularMovies),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MovieSearchDelegate(movieStore),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              _showSortDialog(context);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (movieStore.isLoading && movieStore.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (movieStore.error != null) {
            return Center(child: Text(movieStore.error!));
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                movieStore.loadMoreMovies();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: movieStore.movies.length,
              itemBuilder: (context, index) {
                final movie = movieStore.movies[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie.title!),
                  subtitle: Text(movie.overview!),
                  trailing: IconButton(
                    icon: const Icon(Icons.bookmark),
                    onPressed: () async {
                      await bookmarkStore.addBookmark(movieStore.movies[index]);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).sortBy),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context).title),
                onTap: () {
                  movieStore.setSortCriterion(SortCriterion.title);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).popularity),
                onTap: () {
                  movieStore.setSortCriterion(SortCriterion.popularity);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).filterByGenre),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("All Genres"),
                onTap: () {
                  movieStore.setGenreFilter(null);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).action),
                onTap: () {
                  movieStore.setGenreFilter('28');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).comedy),
                onTap: () {
                  movieStore.setGenreFilter('35');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class MovieSearchDelegate extends SearchDelegate {
  final MovieStore movieStore;

  MovieSearchDelegate(this.movieStore);

  @override
  String get searchFieldLabel => 'Search Movies';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          movieStore.setSearchQuery('');
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    movieStore.setSearchQuery(query);

    return Observer(
      builder: (_) {
        if (movieStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (movieStore.error != null) {
          return Center(child: Text(movieStore.error!));
        }

        if (movieStore.movies.isEmpty) {
          return Center(
            child: Text('No movie with "$query"'),
          );
        }

        return ListView.builder(
          itemCount: movieStore.movies.length,
          itemBuilder: (context, index) {
            final movie = movieStore.movies[index];
            return ListTile(
              leading: Column(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark),
                  ),
                ],
              ),
              title: Text(movie.title!),
              subtitle: Text(movie.overview!),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
