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
        fontWeight: FontWeight.w700,
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
        fontSize: 24,
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightColorScheme.primaryContainer,
      suffixIconColor: lightColorScheme.primary,
      labelStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: lightColorScheme.primary,
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        borderSide: BorderSide(color: lightColorScheme.primary, width: 2.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        borderSide: BorderSide(color: lightColorScheme.primary, width: 2.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
        borderSide: BorderSide(color: lightColorScheme.primary, width: 2.5),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      hourMinuteColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? lightColorScheme.primary
            : lightColorScheme.secondary,
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? lightColorScheme.onPrimary
            : lightColorScheme.onSecondary,
      ),
      padding: const EdgeInsets.all(25),
    ),
    datePickerTheme: DatePickerThemeData(
      headerHelpStyle: const TextStyle(fontSize: 34),
      headerHeadlineStyle: const TextStyle(fontSize: 28),
      headerForegroundColor: lightColorScheme.primary,
      yearForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return lightColorScheme.inversePrimary;
        } else if (states.contains(MaterialState.selected)) {
          return lightColorScheme.onPrimary;
        } else {
          return lightColorScheme.primary;
        }
      }),
    ),
    sliderTheme: SliderThemeData(
        inactiveTrackColor: lightColorScheme.secondaryContainer),
    extensions: const <ThemeExtension<dynamic>>[
      MyColors(
        colorPrimaryLighter: colorPrimaryLighter,
      ),
    ]);

ThemeData darkTheme = lightTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);
