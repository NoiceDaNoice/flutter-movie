import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  @observable
  Locale locale = Locale('en'); 

  @action
  void switchToEnglish() {
    locale = Locale('en');
  }

  @action
  void switchToIndonesian() {
    locale = Locale('id');  
  }
}
