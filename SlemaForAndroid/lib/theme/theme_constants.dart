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
      headlineLarge: TextStyle(
        fontSize: 44,
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
    navigationBarTheme: NavigationBarThemeData(
      //indicatorColor: const Color(0X00000000),
      elevation: 0,
      shadowColor: colorNavigationBarShadow,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        return const TextStyle(
          height: 0.7,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          //color: colorNavigationBarText,
        );
      }),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const IconThemeData(
            size: 36.0,
            //color: colorNavigationBarIconSelected,
          );
        }
        return const IconThemeData(
          size: 36.0,
          //color: colorNavigationBarIcon,
        );
      }),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Dongle',
        fontWeight: FontWeight.w700,
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
    extensions: const <ThemeExtension<dynamic>>[
      MyColors(
        colorPrimaryLighter: colorPrimaryLighter,
      ),
    ]);

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: darkColorScheme);
