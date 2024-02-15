import 'package:flutter/material.dart';

class GetMedicineLabel extends StatelessWidget {
  final String label;
  const GetMedicineLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Colors.white70),
        ),
      ),
    );
  }
}
