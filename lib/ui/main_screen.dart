import 'package:flutter/material.dart';
import 'package:movie_db/service/language_store.dart';
import 'package:movie_db/service/movie_store.dart';
import 'package:movie_db/service/theme_store.dart';
import 'package:movie_db/ui/bookmark_ui.dart';
import 'package:movie_db/ui/movie_ui.dart';
import 'package:movie_db/ui/setting_ui.dart';

import '../app_localizations.dart';
import '../service/bookmark_store.dart';

class MainScreen extends StatefulWidget {
  final ThemeStore themeStore;
  final LanguageStore languageStore;
  final MovieStore movieStore;
  final BookmarkStore bookmarkStore;
  const MainScreen({
    super.key,
    required this.themeStore,
    required this.languageStore,
    required this.movieStore,
    required this.bookmarkStore,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  Widget _pageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      children: [
        MovieUi(
          movieStore: widget.movieStore,
          bookmarkStore: widget.bookmarkStore,
        ),
        BookmarkUi(
          bookmarkStore: widget.bookmarkStore,
        ),
        SettingUi(
          themeStore: widget.themeStore,
          languageStore: widget.languageStore,
        ),
      ],
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: _pageView(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie),
            label: AppLocalizations.of(context).movie,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark),
            label: AppLocalizations.of(context).bookmark,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context).setting,
          ),
        ],
        currentIndex: _selectedIndex,
        // onTap: onItemTapped,
        onTap: (value) {
          _pageController.jumpToPage(
            value,
            // duration: const Duration(milliseconds: 500),
            // curve: Curves.bounceIn,
          );
        },
      ),
    );
  }
}
