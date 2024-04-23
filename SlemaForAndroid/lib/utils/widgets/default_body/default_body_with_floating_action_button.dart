import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_floating_action_button/default_floating_action_button.dart';

class DefaultBodyWithFloatingActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onFloatingButtonPressed;
  const DefaultBodyWithFloatingActionButton(
      {super.key, required this.child, required this.onFloatingButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Flex(direction: Axis.vertical, children: [
          DefaultBody(child: child),
        ]),
        DefaultFloatingActionButton(
          onPressed: onFloatingButtonPressed,
          child: const Icon(Icons.add),
        )
      ]),
    );
  }
}
