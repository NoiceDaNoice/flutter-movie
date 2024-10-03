import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_db/app_localizations.dart';
import 'package:movie_db/service/bookmark_store.dart';

class BookmarkUi extends StatefulWidget {
  final BookmarkStore bookmarkStore;
  const BookmarkUi({super.key, required this.bookmarkStore});

  @override
  State<BookmarkUi> createState() => _BookmarkUiState();
}

class _BookmarkUiState extends State<BookmarkUi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).bookmark),
      ),
      body: Observer(
        builder: (_) {
          if (widget.bookmarkStore.bookmarks.isEmpty) {
            return const Center(child: Text('Bookmark is empty'));
          }
          return ListView.builder(
            itemCount: widget.bookmarkStore.bookmarks.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = widget.bookmarkStore.bookmarks[index];
              return ListTile(
                title: Text(movie.title!),
                subtitle: Text(movie.overview!),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    widget.bookmarkStore.removeBookmark(movie.id!);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
