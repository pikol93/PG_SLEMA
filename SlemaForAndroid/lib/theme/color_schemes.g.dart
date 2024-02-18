import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // Gotowe
  primary: Color(0xFF133150), // Top navigation color
  onPrimary: Color(0xFFFFFFFF), // Text color
  primaryContainer: Color(0xFFFFFEFD), // Main containers color
  onPrimaryContainer: Color(0xFF133150), // Text color in containers
  // Container within container
  secondary: Color(0xFFd0d5da), // Container within container color
  onSecondary: Color(0xFF133150), // Text color
  secondaryContainer: Color(0xFFD4E3FF), // ?
  onSecondaryContainer: Color(0xFF001C3A), // ?
  // ???
  tertiary: Color(0xFF006A67),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF6FF7F2),
  onTertiaryContainer: Color(0xFF00201F),
  // TODO
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  // Gotowe
  background: Color(0xFFE7ECEF), // App main background color
  onBackground: Color(0xFF133150), // Text color
  // ?
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF133150),
  surfaceVariant: Color(0xFF133150),
  onSurfaceVariant: Color(0xFFFFFFFF),
  // Gotowe
  outline: Color(0xFF133150), // Outline for main containers
  // ???
  onInverseSurface: Color(0xFFE1F4FF),
  inverseSurface: Color(0xFF003547),
  inversePrimary: Color(0xFFA0C9FF),
  shadow: Color(0x40000000),
  surfaceTint: Color(0xFF0D61A4),
  outlineVariant: Color(0xFFC3C6CF),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFA0C9FF),
  onPrimary: Color(0xFF00325A),
  primaryContainer: Color(0xFF00487F),
  onPrimaryContainer: Color(0xFFD2E4FF),
  secondary: Color(0xFFA5C8FF),
  onSecondary: Color(0xFF00315E),
  secondaryContainer: Color(0xFF004784),
  onSecondaryContainer: Color(0xFFD4E3FF),
  tertiary: Color(0xFF4DDAD6),
  onTertiary: Color(0xFF003735),
  tertiaryContainer: Color(0xFF00504E),
  onTertiaryContainer: Color(0xFF6FF7F2),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F2A),
  onBackground: Color(0xFFBFE9FF),
  surface: Color(0xFF001F2A),
  onSurface: Color(0xFFBFE9FF),
  surfaceVariant: Color(0xFF43474E),
  onSurfaceVariant: Color(0xFFC3C6CF),
  outline: Color(0xFF8D9199),
  onInverseSurface: Color(0xFF001F2A),
  inverseSurface: Color(0xFFBFE9FF),
  inversePrimary: Color(0xFF0D61A4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFA0C9FF),
  outlineVariant: Color(0xFF43474E),
  scrim: Color(0xFF000000),
);
