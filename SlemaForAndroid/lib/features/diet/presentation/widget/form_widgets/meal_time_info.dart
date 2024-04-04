import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class MealTimeInfo extends StatefulWidget {
  final IconData iconData;
  final String mealTimeName;

  const MealTimeInfo(
      {super.key, required this.iconData, required this.mealTimeName});

  @override
  State<MealTimeInfo> createState() => _MealTimeInfoState();
}

class _MealTimeInfoState extends State<MealTimeInfo> {
  final double prefixIconSize = 60.0;
  final double verticalDividerWidth = 2.0;
  final double verticalDividerBoxHeight = 45.0;
  late double prefixBoxWidth = prefixIconSize + verticalDividerWidth + 14.0;

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: SizedBox(
        width: prefixBoxWidth,
        child: Row(
          children: [
            Icon(
              widget.iconData,
              color: Theme.of(context).primaryColor,
              size: prefixIconSize,
            ),
            SizedBox(
              height: verticalDividerBoxHeight,
              child: VerticalDivider(
                color: Theme.of(context).primaryColor,
                thickness: verticalDividerWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Posiłek",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(height: 1.0)),
                Text(widget.mealTimeName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(height: 1.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
