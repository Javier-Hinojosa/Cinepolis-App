import 'package:Cinepolis/app/utils/colors.utils.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    primaryColorLight: Colors.white70,
    primaryColorDark: Colors.black87,
    inputDecorationTheme: const InputDecorationTheme(alignLabelWithHint: true),
    colorScheme: ColorScheme(
        secondary: ColorsUtils.hexToColor('#212121'),
        primary: Colors.black,
        onSecondary: Colors.white,
        error: Colors.red,
        background: Colors.black45,
        brightness: Brightness.light,
        onBackground: Colors.black45,
        onError: Colors.red,
        onPrimary: Colors.black,
        onSurface: Colors.black45,
        surface: Colors.black45),
    indicatorColor: Colors.white,

    // Define the default font family.
    fontFamily: 'Hind',
    appBarTheme: const AppBarTheme(),

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
    /*  headline1: TextStyle(fontSize: 30.0, color: Colors.black),
      overline: TextStyle(fontSize: 25.0, color: Colors.blue),
      headline2: TextStyle(fontSize: 20.0, color: Colors.black),
      headline3: TextStyle(fontSize: 25.0, color: Colors.black),
      subtitle1: TextStyle(fontSize: 16.0, color: Colors.black),
      subtitle2: TextStyle(fontSize: 18.0, color: Colors.black),
      headline4: TextStyle(fontSize: 15.0, color: Colors.black),
      bodyText1: TextStyle(
          fontSize: 14.0, fontFamily: 'Hind', color: Colors.black), //item title
      bodyText2: TextStyle(
          fontSize: 10.0,
          fontFamily: 'Hind',
          color: Colors.black),*/
    ),
    primaryTextTheme: const TextTheme(
     /* bodyText2: TextStyle(fontSize: 30.0, color: Colors.white),
      headline3: TextStyle(fontSize: 20.0, color: Colors.blue),
      headline2: TextStyle(fontSize: 25.0, color: Colors.white),
      subtitle1: TextStyle(fontSize: 16.0, color: Colors.white),
      headline4: TextStyle(
          fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 15.0, color: Colors.white),
      headline6: TextStyle(fontSize: 14.0, color: Colors.white),*/
    ),
    textSelectionTheme: const TextSelectionThemeData(),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
    )));
