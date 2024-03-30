import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/assessment_help_button.dart';

class AssessmentAppBar extends StatelessWidget {
  final String currentDateString;

  const AssessmentAppBar({super.key, required this.currentDateString});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 4.0,
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      title: Text("Raport zdrowotny",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize)),
      actions: const [
        AssessmentHelpButton(),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
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
      ),
    );
  }
}
