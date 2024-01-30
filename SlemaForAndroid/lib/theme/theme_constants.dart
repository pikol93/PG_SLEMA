import 'package:flutter/material.dart';

import 'package:pg_slema/theme/custom_colors.dart';

const colorSchemeSeed = Color(0xFF1E81B0);

//NavigationBar
const colorNavigationBarBackground = Color(0xFF6793B3);
const colorNavigationBarShadow = Color(0x1A000000);
const colorNavigationBarIcon = Color(0xCCF2F1EB);
const colorNavigationBarIconSelected = Color(0xCCF2F1EB);
const colorNavigationBarText = Color(0xCCF2F1EB);

//AppBar
const colorAppBarText = Color(0xFFF2F1EB);
const colorAppBarTextShadow = Color(0x40000000);
const colorAppBarBackground = Color(0xFF6793B3);

//CustomSaveButton
const colorCustomSaveButtonBackground = Color(0xFF487ABC);
const colorCustomSaveButtonText = Color(0xFFF2F1EB);
const colorCustomInputTextBorder = Color(0xB2878787);

ThemeData lightTheme = ThemeData(
    fontFamily: 'Dongle',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 44,
      ),
      headlineMedium: TextStyle(
        fontSize: 40,
      ),
      headlineSmall: TextStyle(
        fontSize: 32,
      ),
      labelMedium: TextStyle(
        fontSize: 28,
      ),
      labelSmall: TextStyle(
        fontSize: 20,
      ),
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: colorSchemeSeed,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorNavigationBarBackground,
      indicatorColor: const Color(0X00000000),
      elevation: 0,
      shadowColor: colorNavigationBarShadow,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        return const TextStyle(
          height: 0.7,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: colorNavigationBarText,
        );
      }),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const IconThemeData(
            size: 36.0,
            color: colorNavigationBarIconSelected,
          );
        }
        return const IconThemeData(
          size: 36.0,
          color: colorNavigationBarIcon,
        );
      }),
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
      backgroundColor: colorAppBarBackground,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      MyColors(
          formsButtonBackgroundColor: colorCustomSaveButtonBackground,
          formsButtonTextColor: colorCustomSaveButtonText,
          formsCustomTextInputBorderColor: colorCustomInputTextBorder),
    ]);

ThemeData darkTheme =
    ThemeData(useMaterial3: true, brightness: Brightness.dark);
