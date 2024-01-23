import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.formsButtonBackgroundColor,
    required this.formsButtonTextColor,
  });

  final Color? formsButtonBackgroundColor;
  final Color? formsButtonTextColor;

  @override
  MyColors copyWith(
      {Color? formsButtonBackgroundColor, Color? formsButtonTextColor}) {
    return MyColors(
      formsButtonBackgroundColor:
          formsButtonBackgroundColor ?? this.formsButtonBackgroundColor,
      formsButtonTextColor: formsButtonTextColor ?? this.formsButtonTextColor,
    );
  }

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      formsButtonBackgroundColor: Color.lerp(
          formsButtonBackgroundColor, other.formsButtonBackgroundColor, t),
      formsButtonTextColor:
          Color.lerp(formsButtonTextColor, other.formsButtonTextColor, t),
    );
  }
}
