import 'package:flutter/material.dart';

final ThemeData darkAppTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.black54,
  primaryColorLight: Colors.black12,
  primaryColorDark: Colors.black38,
  highlightColor: Colors.white70,
  indicatorColor: Colors.black,
  hoverColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  colorScheme:
      const ColorScheme.dark(secondary: Colors.black12 //this is physics color
          ),
  iconTheme: const IconThemeData(
    color: Colors.white70,
    size: 37,
  ),

  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(
          sizeConstraints:BoxConstraints(maxHeight: 120,maxWidth: 120,minHeight: 50,minWidth: 50),
          backgroundColor: Colors.white38),

  inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white12,
      hoverColor: Colors.yellowAccent,
      focusColor: Colors.green,
      alignLabelWithHint: true),

  // Define the default font family.
  fontFamily: 'Hind',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(

  ),
  primaryTextTheme: const TextTheme(
  ),
);
