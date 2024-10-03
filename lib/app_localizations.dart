import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.languageCode;
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: 'Hello message',
    );
  }

  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: 'Welcome message',
    );
  }

  String get bookmark {
    return Intl.message(
      'Bookmark',
      name: 'bookmark',
      desc: 'Bookmark label',
    );
  }

  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: 'Setting label',
    );
  }

  String get movie {
    return Intl.message(
      'Movie',
      name: 'movie',
      desc: 'Movie label',
    );
  }

  String get popularMovies {
    return Intl.message(
      'Popular Movies',
      name: 'popular_movies',
      desc: 'Label for popular movies',
    );
  }

  String get searchMovie {
    return Intl.message(
      'Search Movies',
      name: 'search_movie',
      desc: 'Label for searching movies',
    );
  }

  String get filterByGenre {
    return Intl.message(
      'Filter By Genre',
      name: 'filter_by_genre',
      desc: 'Label for filtering movies by genre',
    );
  }

  String get action {
    return Intl.message(
      'Action',
      name: 'action',
      desc: 'Action genre label',
    );
  }

  String get comedy {
    return Intl.message(
      'Comedy',
      name: 'comedy',
      desc: 'Comedy genre label',
    );
  }

  String get sortBy {
    return Intl.message(
      'Sort By',
      name: 'sort_by',
      desc: 'Label for sorting movies',
    );
  }

  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: 'Title label',
    );
  }

  String get popularity {
    return Intl.message(
      'Popularity',
      name: 'popularity',
      desc: 'Popularity label',
    );
  }

  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: 'Dark mode label',
    );
  }

  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'light_mode',
      desc: 'Light mode label',
    );
  }

  String get switchTo {
    return Intl.message(
      'Switch to',
      name: 'switch_to',
      desc: 'Switch to label',
    );
  }

  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'Label for English language',
    );
  }

  String get indonesian {
    return Intl.message(
      'Indonesian',
      name: 'indonesian',
      desc: 'Label for Indonesian language',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'id'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
