import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class SingleAssessmentWidget extends StatelessWidget {
  const SingleAssessmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Icon(
                Icons.medication_outlined,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
            Expanded(
              child: Text(
                "asd",
                style: Theme.of(context).textTheme.headlineLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
