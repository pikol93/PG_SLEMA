import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.formsButtonBackgroundColor,
    required this.formsButtonTextColor,
    required this.formsCustomTextInputBorderColor,
  });

  final Color? formsButtonBackgroundColor;
  final Color? formsButtonTextColor;
  final Color? formsCustomTextInputBorderColor;

  @override
  MyColors copyWith(
      {Color? formsButtonBackgroundColor,
      Color? formsButtonTextColor,
      Color? formsCustomTextInputBorderColor}) {
    return MyColors(
      formsButtonBackgroundColor:
          formsButtonBackgroundColor ?? this.formsButtonBackgroundColor,
      formsButtonTextColor: formsButtonTextColor ?? this.formsButtonTextColor,
      formsCustomTextInputBorderColor: formsCustomTextInputBorderColor ??
          this.formsCustomTextInputBorderColor,
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
      formsCustomTextInputBorderColor: Color.lerp(
          formsCustomTextInputBorderColor,
          other.formsCustomTextInputBorderColor,
          t),
    );
  }
}
