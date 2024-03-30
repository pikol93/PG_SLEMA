import 'package:flutter/material.dart';
import 'package:pg_slema/theme/general_container_theme.dart';

class GeneralContainer extends StatelessWidget {
  final String label;
  final Widget child;
  const GeneralContainer({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: generalContainerBoxDecorationTheme,
      child: Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.headlineMedium),
          child,
        ],
      ),
    );
  }
}
