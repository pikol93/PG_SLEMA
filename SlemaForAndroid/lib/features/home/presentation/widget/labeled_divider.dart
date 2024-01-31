import 'package:flutter/material.dart';
import 'package:pg_slema/theme/custom_colors.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  const LabeledDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final MyColors? myColors = Theme.of(context).extension<MyColors>();

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
          padding: const EdgeInsets.only(left: 20.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).navigationBarTheme.backgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: myColors?.formsButtonTextColor ?? Colors.white, //TODO
                height: 1.0),
          ),
        ),
      ),
    );
  }
}
