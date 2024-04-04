import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.colorPrimaryLighter,
  });

  final Color? colorPrimaryLighter;

  @override
  MyColors copyWith({
    Color? colorPrimaryLighter,
  }) {
    return MyColors(
      colorPrimaryLighter: colorPrimaryLighter ?? this.colorPrimaryLighter,
    );
  }

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      colorPrimaryLighter:
          Color.lerp(colorPrimaryLighter, other.colorPrimaryLighter, t),
    );
  }
}
