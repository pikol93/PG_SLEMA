import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/dividers/labeled_section_divider.dart';

class AboutSectionWidget extends StatelessWidget {
  final String sectionTitle;
  final List<Widget> children;

  const AboutSectionWidget({
    super.key,
    required this.sectionTitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledSectionDivider(
          label: sectionTitle,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        )
      ],
    );
  }
}
