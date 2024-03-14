import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class DefaultContainer extends StatelessWidget with Logger {
  final bool shadow;
  const DefaultContainer({super.key, required this.child, this.shadow = true});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: shadow
                    ? [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.shadow,
                          offset: const Offset(0.0, 4.0),
                          blurRadius: 4.0,
                        ),
                      ]
                    : null,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3.0,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
