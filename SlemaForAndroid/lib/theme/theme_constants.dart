import 'package:flutter/material.dart';

import 'package:pg_slema/theme/custom_colors.dart';

const colorSchemeSeed = Color(0xFF1E81B0);

//NavigationBar
const colorNavigationBarBackground = Color(0xFF6793B3);
const colorNavigationBarShadow = Color(0x1A000000);

//AppBar
const colorAppBarText = Color(0xFFF2F1EB);
const colorAppBarTextShadow = Color(0x40000000);

//CustomSaveButton
const colorCustomSaveButtonBackground = Color(0xFF487ABC);
const colorCustomSaveButtonText = Color(0xFFF2F1EB);
const colorCustomInputTextBorder = Color(0xB2878787);

ThemeData lightTheme = ThemeData(
    fontFamily: 'Dongle',
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: colorSchemeSeed,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: colorNavigationBarBackground,
      elevation: 0,
      height: 72,
      shadowColor: colorNavigationBarShadow,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Dongle',
        fontWeight: FontWeight.w700,
        fontSize: 48,
        height: 0.52381,
        color: colorAppBarText,
        shadows: [
          Shadow(
            color: colorAppBarTextShadow,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      iconTheme: IconThemeData(
        weight: 700,
        color: colorAppBarText,
        size: 36,
        shadows: [
          Shadow(
            color: colorAppBarTextShadow,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
    ),
    extensions: const <ThemeExtension<dynamic>>[
      MyColors(
          formsButtonBackgroundColor: colorCustomSaveButtonBackground,
          formsButtonTextColor: colorCustomSaveButtonText,
          formsCustomTextInputBorderColor: colorCustomInputTextBorder),
    ]);

ThemeData darkTheme =
    ThemeData(useMaterial3: true, brightness: Brightness.dark);
