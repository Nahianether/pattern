import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        BoxDecoration,
        Brightness,
        Color,
        Colors,
        EdgeInsets,
        FloatingLabelBehavior,
        FontWeight,
        IconThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        Radius,
        TextStyle,
        ThemeData,
        VisualDensity;
import 'package:flutter/services.dart' show Brightness, SystemUiOverlayStyle;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;


Color kDarkPrimaryColor = Colors.orange.shade900.withValues(alpha: 0.85);

SystemUiOverlayStyle darkUiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: kDarkPrimaryColor,
);

ThemeData darkTheme = ThemeData(
  appBarTheme: lightAppBarTheme,
  scaffoldBackgroundColor: Colors.black,
  fontFamily: GoogleFonts.roboto().fontFamily,
  iconTheme: lightIconThemeData,
  inputDecorationTheme: lightInputDecorationTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

AppBarTheme lightAppBarTheme = AppBarTheme(
  elevation: 0.0,
  backgroundColor: kDarkPrimaryColor,
  titleTextStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);

IconThemeData lightIconThemeData = IconThemeData(color: kDarkPrimaryColor);

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
  enabledBorder: lightOutlineInputBorder,
  focusedBorder: lightOutlineInputBorder,
  border: lightOutlineInputBorder,
);

OutlineInputBorder lightOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  gapPadding: 10,
);

const BoxDecoration lightTabDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(30)),
);
