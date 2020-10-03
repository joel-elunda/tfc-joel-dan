import 'package:flutter/material.dart';
import 'package:congo_translate/models/language.dart';

class TranslateProvider with ChangeNotifier {
  bool _isTranslating = false;
  String _textToTranslate = "";

  Language _firstLanguage = Language('fr', 'Français', true, true, true);
  Language _secondLanguage = Language('ln', 'Lingala', false, false, true);
  // Language _secondLanguage = Language('en', 'English', true, true, true);

  setIsTranslating(bool isTranslating) {
    _isTranslating = isTranslating;
    notifyListeners();
  }

  setTextToTranslate(String text) {
    _textToTranslate = text;
    notifyListeners();
  }

  changeLanguages(Language firstLanguage, Language secondLanguage) {
    _firstLanguage = firstLanguage;
    _secondLanguage = secondLanguage;

    notifyListeners();
  }

  Language get firstLanguage => _firstLanguage;

  Language get secondLanguage => _secondLanguage;

  bool get isTranslating => _isTranslating;

  String get textToTranslate => _textToTranslate;
}
