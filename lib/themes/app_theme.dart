import 'package:flutter/material.dart';

final ThemeData myLightTheme = _myLightTheme();

const Color primaryColor = Color.fromARGB(255, 13, 30, 54);
const String themeBodyFontName = 'Quicksand';
const String themeTitleFontName = 'OpenSans';

ThemeData _myLightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColor,
      onPrimary: Colors.white,
      //secondary: const Color.fromARGB(255, 223, 27, 12),
      //onSecondary: Colors.white,
      error: Colors.red,
      background: Colors.white,
      //onBackground: Colors.black,
    ),
    appBarTheme: _myLightAppBarTheme(base.appBarTheme),
    textTheme: _myLightTextTheme(base.textTheme),
    elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),
    floatingActionButtonTheme:
        _floatingActionButtonTheme(base.floatingActionButtonTheme),
  );
}

AppBarTheme _myLightAppBarTheme(AppBarTheme base) => base.copyWith(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 15,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontFamily: themeTitleFontName,
      ),
    );

TextTheme _myLightTextTheme(TextTheme base) => base.copyWith(
      bodySmall: base.bodySmall!.copyWith(
        //fontWeight: FontWeight.bold,
        fontFamily: themeBodyFontName,
        // font size default 12
        fontSize: 12,
      ),
      bodyMedium: base.bodyMedium!.copyWith(
        //fontWeight: FontWeight.bold,
        fontFamily: themeBodyFontName,
        // font size default 14
        fontSize: 14,
      ),
      bodyLarge: base.bodyLarge!.copyWith(
        //fontWeight: FontWeight.bold,
        fontFamily: themeBodyFontName,
        // font size default 16
        fontSize: 16,
      ),
      titleSmall: base.titleSmall!.copyWith(
        //fontWeight: FontWeight.bold,
        fontFamily: themeTitleFontName,
        // font size default 14
        fontSize: 14,
      ),
      titleMedium: base.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: themeTitleFontName,
        // font size default 16
        fontSize: 16,
      ),
      titleLarge: base.titleLarge!.copyWith(
        // fontWeight: FontWeight.bold,
        fontFamily: themeTitleFontName,
        // font size default 22
        fontSize: 22,
      ),
      labelSmall: base.labelSmall!.copyWith(
        //fontWeight: FontWeight.bold,
        fontFamily: themeBodyFontName,
        // font size default 11
        //fontSize: 14,
      ),
      labelMedium: base.labelMedium!.copyWith(
        //fontWeight: FontWeight.bold,
        fontFamily: themeBodyFontName,
        // font size default 12
        //fontSize: 12,
      ),
      labelLarge: base.labelLarge!.copyWith(
        //fontWeight: FontWeight.bold,
        fontFamily: themeBodyFontName,
        // font size default 14
        //fontSize: 14,
      ),
    );

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base) =>
    const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );

ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          primaryColor,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );

FloatingActionButtonThemeData _floatingActionButtonTheme(
        FloatingActionButtonThemeData base) =>
    base.copyWith(
      backgroundColor: primaryColor,
    );
