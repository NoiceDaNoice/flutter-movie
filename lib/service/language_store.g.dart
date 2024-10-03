// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageStore on _LanguageStore, Store {
  late final _$localeAtom =
      Atom(name: '_LanguageStore.locale', context: context);

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$_LanguageStoreActionController =
      ActionController(name: '_LanguageStore', context: context);

  @override
  void switchToEnglish() {
    final _$actionInfo = _$_LanguageStoreActionController.startAction(
        name: '_LanguageStore.switchToEnglish');
    try {
      return super.switchToEnglish();
    } finally {
      _$_LanguageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchToIndonesian() {
    final _$actionInfo = _$_LanguageStoreActionController.startAction(
        name: '_LanguageStore.switchToIndonesian');
    try {
      return super.switchToIndonesian();
    } finally {
      _$_LanguageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locale: ${locale}
    ''';
  }
}
