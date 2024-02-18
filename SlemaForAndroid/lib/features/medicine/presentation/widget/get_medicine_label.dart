import 'package:flutter/material.dart';

class GetMedicineLabel extends StatelessWidget {
  final String label;
  const GetMedicineLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.lightBlueAccent,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              offset: const Offset(0.0, 4.0),
              blurRadius: 4.0,
            ),
          ],
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
          child: Text(label,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(height: 1.0)),
        ),
      ),
    );
  }
}
