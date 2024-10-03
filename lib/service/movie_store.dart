import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:movie_db/service/bookmark_store.dart';
import '../model/movie.dart';

part 'movie_store.g.dart';

enum SortCriterion { title, popularity }

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  final Dio dio = Dio();
  final BookmarkStore bookmarkStore = BookmarkStore();

  _MovieStore() {
    fetchMovies();
  }

  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  String searchQuery = '';

  @observable
  String? genreFilter;

  @observable
  int currentPage = 1;

  @observable
  bool hasMorePages = true;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  SortCriterion sortCriterion = SortCriterion.popularity;

  @action
  void setSortCriterion(SortCriterion criterion) {
    sortCriterion = criterion;
    sortMovies();
  }

  @action
  void sortMovies() {
    if (sortCriterion == SortCriterion.title) {
      movies.sort((a, b) => a.title!.compareTo(b.title!));
    } else if (sortCriterion == SortCriterion.popularity) {
      movies.sort((a, b) => b.popularity!.compareTo(a.popularity!));
    }
  }

  @action
  void setSearchQuery(String query) {
    searchQuery = query;
    fetchMovies(isRefresh: true);
  }

  @action
  void setGenreFilter(String? genre) {
    genreFilter = genre;
    fetchMovies(isRefresh: true);
  }

  @action
  Future<void> fetchMovies({bool isRefresh = false}) async {
    if (isLoading) return;

    isLoading = true;
    error = null;

    try {
      if (isRefresh) {
        currentPage = 1;
        movies.clear();
      }

      final String endpoint = searchQuery.isEmpty
          ? 'https://api.themoviedb.org/3/movie/popular'
          : 'https://api.themoviedb.org/3/search/movie';

      final queryParameters = {
        'api_key': '<API-KEY>',
        'page': currentPage,
        if (searchQuery.isNotEmpty) 'query': searchQuery,
        if (genreFilter != null) 'with_genres': genreFilter,
      };

      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      print('responsenya ini $response');
      final results = response.data['results'] as List;
      final fetchedMovies =
          results.map((json) => Movie.fromJson(json)).toList();

      if (results.isEmpty || currentPage >= response.data['total_pages']) {
        hasMorePages = false;
      } else {
        hasMorePages = true;
        currentPage++;
      }

      movies.addAll(fetchedMovies);

      sortMovies();
    } on DioException catch (e) {
      error = "Failed to fetch movies: ${e.toString()}";
      if (e.response != null) {
        print(e.response!.data);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadMoreMovies() async {
    if (hasMorePages) {
      await fetchMovies();
    }
  }
}
