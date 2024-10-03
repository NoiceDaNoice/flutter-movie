// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookmarkStore on _BookmarkStore, Store {
  late final _$bookmarksAtom =
      Atom(name: '_BookmarkStore.bookmarks', context: context);

  @override
  ObservableList<Movie> get bookmarks {
    _$bookmarksAtom.reportRead();
    return super.bookmarks;
  }

  @override
  set bookmarks(ObservableList<Movie> value) {
    _$bookmarksAtom.reportWrite(value, super.bookmarks, () {
      super.bookmarks = value;
    });
  }

  late final _$addBookmarkAsyncAction =
      AsyncAction('_BookmarkStore.addBookmark', context: context);

  @override
  Future<void> addBookmark(Movie movie) {
    return _$addBookmarkAsyncAction.run(() => super.addBookmark(movie));
  }

  late final _$removeBookmarkAsyncAction =
      AsyncAction('_BookmarkStore.removeBookmark', context: context);

  @override
  Future<void> removeBookmark(int movieId) {
    return _$removeBookmarkAsyncAction.run(() => super.removeBookmark(movieId));
  }

  late final _$loadBookmarksAsyncAction =
      AsyncAction('_BookmarkStore.loadBookmarks', context: context);

  @override
  Future<void> loadBookmarks() {
    return _$loadBookmarksAsyncAction.run(() => super.loadBookmarks());
  }

  @override
  String toString() {
    return '''
bookmarks: ${bookmarks}
    ''';
  }
}
