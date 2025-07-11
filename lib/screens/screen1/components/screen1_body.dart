import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme/theme.dart';
import '../../../providers/language/language.dart';
import '../../../models/theme/theme.dart';
import '../../../localization/localization.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final t = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t.home,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            t.appTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 40),
          
          // Theme Toggle Button
          ElevatedButton(
            onPressed: () {
              final newTheme = themeProvider.currentTheme == Themes.light 
                  ? Themes.dark 
                  : Themes.light;
              themeProvider.changeTheme(newTheme);
            },
            child: Text(
              themeProvider.currentTheme == Themes.light 
                  ? 'Switch to Dark Theme' 
                  : 'Switch to Light Theme'
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Language Toggle Button
          ElevatedButton(
            onPressed: () {
              final newLanguage = languageProvider.currentLocale.languageCode == 'en' 
                  ? 'bn' 
                  : 'en';
              languageProvider.changeLanguage(newLanguage);
            },
            child: Text(
              languageProvider.currentLocale.languageCode == 'en' 
                  ? 'Switch to Bengali' 
                  : 'Switch to English'
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Current Settings Display
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Current Theme: ${themeProvider.currentTheme.name}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Current Language: ${languageProvider.currentLocale.languageCode}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
