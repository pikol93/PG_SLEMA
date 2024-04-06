import 'package:flutter/material.dart';

class LabeledSectionDivider extends StatelessWidget {
  final String label;
  const LabeledSectionDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, top: 3.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary, height: 0.75),
          ),
        ),
      ),
    );
  }
}
