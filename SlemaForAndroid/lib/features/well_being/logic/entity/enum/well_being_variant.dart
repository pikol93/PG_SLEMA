import 'package:flutter/material.dart';

// TODO: Rename this.
enum WellBeingVariant {
  awful,
  bad,
  neutral,
  good,
  great,
}

extension WellBeingExtension on WellBeingVariant {
  static WellBeingVariant from(String text) {
    return WellBeingVariant.values.firstWhere(
      (element) => element.savedValueRepresentation == text,
      orElse: () => WellBeingVariant.neutral,
    );
  }

  String get savedValueRepresentation {
    switch (this) {
      case WellBeingVariant.awful:
        return "0";
      case WellBeingVariant.bad:
        return "1";
      case WellBeingVariant.neutral:
        return "2";
      case WellBeingVariant.good:
        return "3";
      case WellBeingVariant.great:
        return "4";
    }
  }

  String get textRepresentation {
    switch (this) {
      case WellBeingVariant.awful:
        return "Okropne";
      case WellBeingVariant.bad:
        return "Złe";
      case WellBeingVariant.neutral:
        return "Neutralne";
      case WellBeingVariant.good:
        return "Dobre";
      case WellBeingVariant.great:
        return "Wspaniałe";
    }
  }

  Color get colorRepresentation {
    switch (this) {
      case WellBeingVariant.awful:
        return Colors.redAccent;
      case WellBeingVariant.bad:
        return Colors.orangeAccent;
      case WellBeingVariant.neutral:
        return Colors.yellowAccent;
      case WellBeingVariant.good:
        return Colors.greenAccent;
      case WellBeingVariant.great:
        return Colors.blueAccent;
    }
  }

  Image get icon {
    switch (this) {
      case WellBeingVariant.awful:
        return Image.asset("assets/wellbeing/variants/awful.png");
      case WellBeingVariant.bad:
        return Image.asset("assets/wellbeing/variants/bad.png");
      case WellBeingVariant.neutral:
        return Image.asset("assets/wellbeing/variants/neutral.png");
      case WellBeingVariant.good:
        return Image.asset("assets/wellbeing/variants/good.png");
      case WellBeingVariant.great:
        return Image.asset("assets/wellbeing/variants/great.png");
    }
  }
}
