import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_db/service/language_store.dart';

import '../app_localizations.dart';
import '../service/theme_store.dart';

class SettingUi extends StatefulWidget {
  final ThemeStore themeStore;
  final LanguageStore languageStore;
   SettingUi({
    super.key,
    required this.themeStore,
    required this.languageStore,
  });

  @override
  State<SettingUi> createState() => _SettingUiState();
}

class _SettingUiState extends State<SettingUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).hello),
            TextButton.icon(
              icon: Observer(
                builder: (_) {
                  return Icon(
                    widget.themeStore.isDarkMode
                        ? Icons.wb_sunny
                        : Icons.nightlight_round,
                  );
                },
              ),
              label: Observer(
                builder: (_) {
                  return Text(
                    widget.themeStore.isDarkMode ? AppLocalizations.of(context).lightMode : AppLocalizations.of(context).darkMode,
                  );
                },
              ),
              onPressed: () {
                widget.themeStore.toggleDarkMode();
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.language),
              label: Observer(
                builder: (_) {
                  return Text(
                    widget.languageStore.locale.languageCode == 'en'
                        ? 'Switch to Indonesian'
                        : 'Switch to English',
                  );
                },
              ),
              onPressed: () {
                if (widget.languageStore.locale.languageCode == 'en') {
                  widget.languageStore.switchToIndonesian();
                } else {
                  widget.languageStore.switchToEnglish();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
