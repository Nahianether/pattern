import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialApp,
        StatelessWidget,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:flutter/services.dart' show SystemChrome;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart' show MultiProvider, Provider;

import 'components/common/functions/no_internet.dart';
import 'database/functions.dart' show HiveFuntions;
import 'helpers/themes/themes.dart' show uiConfig;
import 'localization/loalization.dart';
import 'providers/providers.dart';
import 'providers/theme/theme.dart' show ThemeProvider;
import 'providers/language/language.dart' show LanguageProvider;
import 'screens/wrapper.dart' show Wrapper;

Future<void> main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: providers,
      child: const Main(),
    ),
  );
}

Future<void> _init() async {
  await Hive.initFlutter();
  HiveFuntions.registerHiveAdepters();
  await HiveFuntions.openAllBoxes();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
  initConnectionListener();
}

class Main extends StatelessWidget {
  const Main({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme,
      locale: languageProvider.currentLocale,
      onGenerateTitle: onGenerateTitle,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      home: Wrapper(),
    );
  }
}
