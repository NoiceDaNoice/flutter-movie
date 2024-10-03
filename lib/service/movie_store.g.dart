// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  late final _$moviesAtom = Atom(name: '_MovieStore.movies', context: context);

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_MovieStore.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$genreFilterAtom =
      Atom(name: '_MovieStore.genreFilter', context: context);

  @override
  String? get genreFilter {
    _$genreFilterAtom.reportRead();
    return super.genreFilter;
  }

  @override
  set genreFilter(String? value) {
    _$genreFilterAtom.reportWrite(value, super.genreFilter, () {
      super.genreFilter = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_MovieStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$hasMorePagesAtom =
      Atom(name: '_MovieStore.hasMorePages', context: context);

  @override
  bool get hasMorePages {
    _$hasMorePagesAtom.reportRead();
    return super.hasMorePages;
  }

  @override
  set hasMorePages(bool value) {
    _$hasMorePagesAtom.reportWrite(value, super.hasMorePages, () {
      super.hasMorePages = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MovieStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_MovieStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$sortCriterionAtom =
      Atom(name: '_MovieStore.sortCriterion', context: context);

  @override
  SortCriterion get sortCriterion {
    _$sortCriterionAtom.reportRead();
    return super.sortCriterion;
  }

  @override
  set sortCriterion(SortCriterion value) {
    _$sortCriterionAtom.reportWrite(value, super.sortCriterion, () {
      super.sortCriterion = value;
    });
  }

  late final _$fetchMoviesAsyncAction =
      AsyncAction('_MovieStore.fetchMovies', context: context);

  @override
  Future<void> fetchMovies({bool isRefresh = false}) {
    return _$fetchMoviesAsyncAction
        .run(() => super.fetchMovies(isRefresh: isRefresh));
  }

  late final _$loadMoreMoviesAsyncAction =
      AsyncAction('_MovieStore.loadMoreMovies', context: context);

  @override
  Future<void> loadMoreMovies() {
    return _$loadMoreMoviesAsyncAction.run(() => super.loadMoreMovies());
  }

  late final _$_MovieStoreActionController =
      ActionController(name: '_MovieStore', context: context);

  @override
  void setSortCriterion(SortCriterion criterion) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.setSortCriterion');
    try {
      return super.setSortCriterion(criterion);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortMovies() {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.sortMovies');
    try {
      return super.sortMovies();
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.setSearchQuery');
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGenreFilter(String? genre) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.setGenreFilter');
    try {
      return super.setGenreFilter(genre);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
searchQuery: ${searchQuery},
genreFilter: ${genreFilter},
currentPage: ${currentPage},
hasMorePages: ${hasMorePages},
isLoading: ${isLoading},
error: ${error},
sortCriterion: ${sortCriterion}
    ''';
  }
}
