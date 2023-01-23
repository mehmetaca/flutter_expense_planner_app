import 'package:flutter/material.dart';

final ThemeData myLightTheme = _myLightTheme();

const Color primaryColor =  Color.fromARGB(255, 13, 30, 54);

ThemeData _myLightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColor,
      onPrimary: Colors.white,
      //secondary: const Color.fromARGB(255, 223, 27, 12),
      //onSecondary: Colors.white,
      error: Colors.red,
      background:  Colors.white,
      //onBackground: Colors.black,
    ),

    textTheme: _myLightTextTheme(base.textTheme),
    elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),
    floatingActionButtonTheme: _floatingActionButtonTheme(base.floatingActionButtonTheme),
  );
}



TextTheme _myLightTextTheme(TextTheme base) => base.copyWith(
/*
  headline1: base.headline1!.copyWith(

      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Colors.white),
*/

  bodyText1: base.bodyText1!.copyWith(

      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black),

  bodyText2: base.bodyText2!.copyWith(

      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: Colors.black),
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


FloatingActionButtonThemeData _floatingActionButtonTheme(FloatingActionButtonThemeData base) =>
   base.copyWith(
     backgroundColor: primaryColor,
   );