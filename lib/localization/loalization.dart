import 'package:flutter/material.dart' show BuildContext, Locale;
import 'localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;

AppLocalizations? t;

const localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const supportedLocales = [Locale('en'), Locale('bn')];

String onGenerateTitle(BuildContext context) =>
    AppLocalizations.of(context)!.appTitle;
