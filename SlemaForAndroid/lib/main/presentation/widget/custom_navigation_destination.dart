import 'package:flutter/material.dart';

class CustomNavigationDestination extends StatefulWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final int currentSelectedIndex;
  final int destinationIndex;
  final void Function(int) onPressed;
  const CustomNavigationDestination(
      {super.key,
      required this.icon,
      required this.selectedIcon,
      required this.label,
      required this.onPressed,
      required this.currentSelectedIndex,
      required this.destinationIndex});

  @override
  CustomNavigationDestinationState createState() =>
      CustomNavigationDestinationState();
}

class CustomNavigationDestinationState
    extends State<CustomNavigationDestination> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      isSelected: widget.destinationIndex == widget.currentSelectedIndex,
      selectedIcon: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Icon(
            widget.selectedIcon,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      icon: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 4.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            widget.icon,
            size: 48,
          )),
      tooltip: widget.label,
      onPressed: () {
        widget.onPressed(widget.destinationIndex);
      },
    );
  }
}
