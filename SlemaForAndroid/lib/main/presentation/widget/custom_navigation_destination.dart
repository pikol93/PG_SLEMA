import 'package:flutter/material.dart';

class CustomNavigationDestination extends StatefulWidget {
  final Icon icon;
  final Icon selectedIcon;
  final String label;
  const CustomNavigationDestination(
      {super.key,
      required this.icon,
      required this.selectedIcon,
      required this.label});

  @override
  CustomNavigationDestinationState createState() =>
      CustomNavigationDestinationState();
}

class CustomNavigationDestinationState
    extends State<CustomNavigationDestination> {
  @override
  Widget build(BuildContext context) {
    final iconThemeData = Theme.of(context)
        .navigationBarTheme
        .iconTheme!
        .resolve(<MaterialState>{});

    return NavigationDestination(
      selectedIcon: Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: iconThemeData?.color ?? Colors.transparent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: widget.selectedIcon),
      icon: Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: iconThemeData?.color ?? Colors.transparent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: widget.icon),
      label: widget.label,
    );
  }
}
