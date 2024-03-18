import 'package:flutter/material.dart';

import 'package:pg_slema/utils/widgets/default_container/default_container.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';

class ContainerWithDivider extends StatefulWidget {
  final IconData? iconDataLeft;
  final String label;
  final VoidCallback? onIconRightPressed;
  final IconData? iconDataRight;
  final Widget? child;
  const ContainerWithDivider(
      {super.key,
      this.iconDataLeft,
      required this.label,
      this.onIconRightPressed,
      this.child,
      this.iconDataRight});

  @override
  ContainerWithDividerState createState() => ContainerWithDividerState();
}

class ContainerWithDividerState extends State<ContainerWithDivider> {
  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.iconDataLeft != null)
                const Icon(Icons.egg_alt, size: 30.0),
              const SizedBox(width: 5.0),
              Text(
                widget.label,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(height: 0.59),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: widget.iconDataRight != null
                      ? IconButton(
                          onPressed: widget.onIconRightPressed,
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.4),
                          icon: Icon(widget.iconDataRight),
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          constraints: const BoxConstraints(),
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        )
                      : null,
                ),
              )
            ],
          ),
          const ContainerDivider(),
          widget.child ?? Container(),
        ],
      ),
    );
  }
}
