import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AddAssessmentScreenProgressBar extends StatefulWidget
    implements PreferredSizeWidget {
  const AddAssessmentScreenProgressBar({super.key});

  @override
  State<StatefulWidget> createState() => _AddAssessmentScreenProgressBarState();

  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class _AddAssessmentScreenProgressBarState
    extends State<AddAssessmentScreenProgressBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: This widget is unused because of problems with inserting it into the AppBar's bottom panel
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 24,
              ),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: LinearProgressIndicator(
                  value: 1 / 3,
                  color: Colors.green,
                ),
              ),
            ),
            const Center(
              child: Text("1/3"),
            )
          ],
        ),
      ),
    );
  }
}
