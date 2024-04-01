import 'package:flutter/material.dart';

enum WellBeing {
  awful,
  bad,
  neutral,
  good,
  great,
}

extension WellBeingExtension on WellBeing {
  static WellBeing from(String text) {
    return WellBeing.values.firstWhere(
      (element) => element.name == text,
      orElse: () => WellBeing.neutral,
    );
  }

  String get textRepresentation {
    switch (this) {
      case WellBeing.awful:
        return "Okropne";
      case WellBeing.bad:
        return "Złe";
      case WellBeing.neutral:
        return "Neutralne";
      case WellBeing.good:
        return "Dobre";
      case WellBeing.great:
        return "Wspaniałe";
    }
  }

  Color get colorRepresentation {
    switch (this) {
      case WellBeing.awful:
        return Colors.redAccent;
      case WellBeing.bad:
        return Colors.orangeAccent;
      case WellBeing.neutral:
        return Colors.yellowAccent;
      case WellBeing.good:
        return Colors.greenAccent;
      case WellBeing.great:
        return Colors.blueAccent;
    }
  }

  Image get icon {
    switch (this) {
      case WellBeing.awful:
        return Image.asset("assets/wellbeing/variants/awful.png");
      case WellBeing.bad:
        return Image.asset("assets/wellbeing/variants/bad.png");
      case WellBeing.neutral:
        return Image.asset("assets/wellbeing/variants/neutral.png");
      case WellBeing.good:
        return Image.asset("assets/wellbeing/variants/good.png");
      case WellBeing.great:
        return Image.asset("assets/wellbeing/variants/great.png");
    }
  }
}
