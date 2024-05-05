import 'package:flutter/material.dart';

class DefaultContainerWithOnTap extends StatelessWidget {
  final bool shadow;
  final EdgeInsets padding;
  final Function onTap;
  const DefaultContainerWithOnTap(
      {super.key,
      required this.child,
      this.shadow = true,
      this.padding = const EdgeInsets.all(0),
      required this.onTap});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
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
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3.0,
                  ),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  onTap: () => onTap(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
