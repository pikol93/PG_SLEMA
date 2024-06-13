import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:uuid/uuid.dart';

class DefaultBodyWithMultipleFloatingActionButtons extends StatelessWidget {
  final Widget child;
  final List<(void Function(), IconData)> buttons;

  const DefaultBodyWithMultipleFloatingActionButtons({
    super.key,
    required this.child,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Flex(
            direction: Axis.vertical,
            children: [
              DefaultBody(
                child: child,
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Row(
              children: buttons
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: FloatingActionButton(
                        onPressed: item.$1,
                        heroTag: const Uuid().v4(),
                        child: Icon(item.$2),
                      ),
                    ),
                  )
                  .toList(growable: false),
            ),
          ),
        ],
      ),
    );
  }
}
