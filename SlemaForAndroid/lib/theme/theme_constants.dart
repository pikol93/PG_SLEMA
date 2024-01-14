import 'package:flutter/material.dart';

const colorSchemeSeed = Color(0xFF1E81B0);

//NavigationBar
const colorNavigationBarBackground = Color(0xFF6793B3);
const colorNavigationBarShadow = Color(0x1A000000);

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: colorSchemeSeed,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: colorNavigationBarBackground,
      elevation: 0,
      height: 72,
      shadowColor: colorNavigationBarShadow,
    ));

ThemeData darkTheme =
    ThemeData(useMaterial3: true, brightness: Brightness.dark);
