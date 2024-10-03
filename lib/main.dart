import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_db/app_localizations.dart';
import 'package:movie_db/service/bookmark_store.dart';
import 'package:movie_db/service/language_store.dart';
import 'package:movie_db/service/theme_store.dart';
import 'package:movie_db/ui/main_screen.dart';
import 'service/movie_store.dart';

/*
Gary Adam
https://github.com/NoiceDaNoice
https://www.linkedin.com/in/garyadam1234/

notes:
First time using sembast, mobx and intl for localization
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeStore themeStore = ThemeStore();
  final LanguageStore languageStore = LanguageStore();
  final MovieStore movieStore = MovieStore();
  final BookmarkStore bookmarkStore = BookmarkStore();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          locale: languageStore.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('id'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
            brightness:
                themeStore.isDarkMode ? Brightness.dark : Brightness.light,
          ),
          home: MainScreen(
            themeStore: themeStore,
            languageStore: languageStore,
            movieStore: movieStore,
            bookmarkStore: bookmarkStore,
          ),
        );
      },
    );
  }
}
