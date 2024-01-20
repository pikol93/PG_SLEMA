import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentFormContainer extends StatelessWidget with Logger {
  const AssessmentFormContainer({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(3, 3),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: child,
                )),
          ),
        ),
      ],
    );
  }
}
