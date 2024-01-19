enum WellBeing {
  horrible,
  bad,
  neutral,
  good,
  great,
}

extension WellBeingExtension on WellBeing {
  String get name {
    switch (this) {
      case WellBeing.horrible:
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

  String get icon {
    // TODO: aisudiausbhdiasubdibausd
    return "TODO";
  }
}
