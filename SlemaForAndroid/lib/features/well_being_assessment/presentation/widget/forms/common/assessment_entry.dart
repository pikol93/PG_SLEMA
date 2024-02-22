import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentFormContainer extends StatelessWidget with Logger {
  const AssessmentFormContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      )
                    ],
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3.0,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child,
                )),
          ),
        ),
      ],
    );
  }
}
