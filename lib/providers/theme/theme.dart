import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

import '../../database/hive.dart' show Boxes;
import '../../helpers/themes/dark/dark.dart';
import '../../helpers/themes/light/light.dart' show lightTheme;
import '../../models/config/config.dart' show Configs;
import '../../models/theme/theme.dart' show Themes;

class ThemeProvider with ChangeNotifier {
  late Themes _currentTheme;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() {
    if (Boxes.configs.containsKey('data')) {
      _currentTheme = Boxes.configs.get('data')!.theme ?? Themes.light;
    } else {
      _currentTheme = Themes.light;
    }
  }

  Themes get currentTheme => _currentTheme;
  
  ThemeData get theme => _currentTheme == Themes.light ? lightTheme : darkTheme;

  Future<void> changeTheme(Themes newTheme) async {
    _currentTheme = newTheme;
    
    if (Boxes.configs.containsKey('data')) {
      var configData = Boxes.configs.get('data')!;
      configData.theme = newTheme;
      await configData.save();
    } else {
      await Boxes.configs
          .put('data', Configs(theme: newTheme, isFirstLaunch: false));
    }
    notifyListeners();
  }
}
