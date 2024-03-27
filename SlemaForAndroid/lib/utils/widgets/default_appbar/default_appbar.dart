import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final List<Widget>? actions;

  const DefaultAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 10,
      backgroundColor: Theme.of(context).primaryColor,
      title: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
        ), // TODO Icon has padding of 8.0. Result? Text not aligned.
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      ),
      iconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: Theme.of(context).colorScheme.onPrimary, size: 38),
      actions: actions,
      leading: leading,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
