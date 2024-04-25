import 'package:flutter/material.dart';

class PopupMenuEditDeleteButton extends StatelessWidget {
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const PopupMenuEditDeleteButton({
    super.key,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void Function()>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: onEditPressed,
            child: Text(
              'Edytuj',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          PopupMenuItem(
            value: onDeletePressed,
            child: Text('Usuń',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.error)),
          ),
        ];
      },
      onSelected: (fn) => fn(),
    );
  }
}
