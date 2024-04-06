import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/presentation/widget/link_button.dart';

class NavigatorPushLinkButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Widget Function(BuildContext) builder;

  const NavigatorPushLinkButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LinkButton(
      iconData: iconData,
      label: label,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: builder,
          ),
        );
      },
    );
  }
}
