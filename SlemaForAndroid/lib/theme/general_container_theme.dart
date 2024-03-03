import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/theme/color_schemes.g.dart';

BoxDecoration generalContainerBoxDecorationTheme = BoxDecoration(
  color: lightColorScheme.primaryContainer,
  borderRadius: BorderRadius.circular(18),
  border: Border.all(
    width: 2.5,
    color: lightColorScheme.primary,
  ),
);

TextStyle generalContainerTextStyleTheme = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
  color: lightColorScheme.primary,
);
