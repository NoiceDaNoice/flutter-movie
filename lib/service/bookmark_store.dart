import 'package:mobx/mobx.dart';
import 'package:movie_db/model/movie.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

part 'bookmark_store.g.dart';

class BookmarkStore = _BookmarkStore with _$BookmarkStore;

abstract class _BookmarkStore with Store {
  static const String STORE_NAME = 'bookmarks';
  final _store = intMapStoreFactory.store(STORE_NAME);
  Database? _database;

  @observable
  ObservableList<Movie> bookmarks = ObservableList<Movie>();

  Future<Database> get database async {
    if (_database != null) return _database!;
    final appDocDir = await getApplicationDocumentsDirectory();
    _database = await databaseFactoryIo.openDatabase(
      path.join(appDocDir.path, 'my_database.db'),
    );
    return _database!;
  }

  @action
  Future<void> addBookmark(Movie movie) async {
    if (bookmarks.any((bMovie) => bMovie.id == movie.id)) {
      return;
    }
    final db = await database;
    await _store.record(movie.id!).put(db, movie.toJson());
    bookmarks.add(movie);
  }

  @action
  Future<void> removeBookmark(int movieId) async {
    final db = await database;
    await _store.record(movieId).delete(db);
    bookmarks.removeWhere((movie) => movie.id == movieId);
  }

  @action
  Future<void> loadBookmarks() async {
    final db = await database;
    final snapshots = await _store.find(db);
    bookmarks.clear();
    bookmarks.addAll(
        snapshots.map((snapshot) => Movie.fromJson(snapshot.value)).toList());
  }
}
