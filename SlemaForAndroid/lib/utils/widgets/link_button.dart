import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final void Function() onTap;

  const LinkButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              iconData,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(height: .75)),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 40,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
