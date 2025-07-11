import 'package:flutter/material.dart' show ChangeNotifier, Locale;

import '../../database/hive.dart' show Boxes;
import '../../models/config/config.dart' show Configs;
import '../../models/theme/theme.dart' show Themes;

class LanguageProvider with ChangeNotifier {
  late Locale _currentLocale;

  LanguageProvider() {
    _loadLanguage();
  }

  void _loadLanguage() {
    if (Boxes.configs.containsKey('data')) {
      final configData = Boxes.configs.get('data')!;
      final savedLanguage = configData.language ?? 'en';
      _currentLocale = Locale(savedLanguage);
    } else {
      _currentLocale = const Locale('en');
    }
  }

  Locale get currentLocale => _currentLocale;

  Future<void> changeLanguage(String languageCode) async {
    _currentLocale = Locale(languageCode);
    
    if (Boxes.configs.containsKey('data')) {
      var configData = Boxes.configs.get('data')!;
      configData.language = languageCode;
      await configData.save();
    } else {
      await Boxes.configs.put('data', Configs(
        theme: Themes.light, 
        isFirstLaunch: false,
        language: languageCode,
      ));
    }
    notifyListeners();
  }
}