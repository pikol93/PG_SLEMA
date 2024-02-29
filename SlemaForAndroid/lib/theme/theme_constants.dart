import 'package:flutter/material.dart';

import 'package:pg_slema/theme/custom_colors.dart';
import 'package:pg_slema/theme/color_schemes.g.dart';

const colorPrimaryLighter = Color(0xB2133150);
const colorNavigationBarShadow = Color(0x1A000000);
const colorAppBarTextShadow = Color(0x40000000);

ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    fontFamily: 'Dongle',
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 64,
        fontFamily: 'Dongle',
      ),
      displayMedium: TextStyle(
        fontSize: 54,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontSize: 40,
      ),
      headlineSmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      labelLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        fontSize: 20,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: lightColorScheme.onPrimaryContainer,
    ),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      iconSize: MaterialStatePropertyAll(36),
    )),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Dongle',
        fontWeight: FontWeight.w700,
        fontSize: 64,
        height: 0.0,
        color: lightColorScheme.onPrimary,
        shadows: const [
          Shadow(
            color: colorAppBarTextShadow,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      iconTheme: const IconThemeData(
        weight: 700,
        color: colorNavigationBarShadow,
        size: 36,
        shadows: [
          Shadow(
            color: colorAppBarTextShadow,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      //backgroundColor: colorAppBarBackground,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      iconSize: 40,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? lightColorScheme.primary
              : lightColorScheme.primaryContainer),
    ),
    extensions: const <ThemeExtension<dynamic>>[
      MyColors(
        colorPrimaryLighter: colorPrimaryLighter,
      ),
    ]);

ThemeData darkTheme = lightTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);
