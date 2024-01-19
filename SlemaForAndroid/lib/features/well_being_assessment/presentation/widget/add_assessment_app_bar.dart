import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/add_assessment_help_button.dart';

class AddAssessmentAppBar extends AppBar {
  static const edgeInsets =
      EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0);

  AddAssessmentAppBar(currentDateString, {super.key})
      : super(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(15, 10),
            ),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddAssessmentHelpButton(),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: edgeInsets,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Raport zdrowotny",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            currentDateString,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: edgeInsets,
                    child: Stack(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 16,
                          ),
                          child: const ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8)),
                            child: LinearProgressIndicator(
                              value: 0.5,
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
                ],
              ),
            ),
          ),
        );
}
