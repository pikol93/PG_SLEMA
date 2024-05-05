import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_entries.dart';
import 'package:pg_slema/features/well_being/presentation/widget/modify_symptoms/symptoms_bottom_bar.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class ModifySymptomsScreen extends StatefulWidget {
  final Assessment assessment;
  final void Function(Assessment Function(Assessment)) onDataChanged;

  const ModifySymptomsScreen({
    super.key,
    required this.assessment,
    required this.onDataChanged,
  });

  @override
  State<ModifySymptomsScreen> createState() => ModifySymptomsScreenState();
}

class ModifySymptomsScreenState extends State<ModifySymptomsScreen>
    with Logger {
  late Assessment assessment;

  @override
  void initState() {
    super.initState();

    assessment = widget.assessment;
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme.labelMedium;

    return Scaffold(
      body: Column(
        children: [
          const DefaultAppBar(title: "Symptomy"),
          DefaultBody(
            mainWidgetsPaddingHorizontal: 0.0,
            child: ListView.builder(
              itemCount: assessment.symptomEntries.symptomEntries.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              onDeletePressed(index);
                            },
                            icon: Icon(
                              Icons.close,
                              color: buttonColor,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              assessment
                                  .symptomEntries.symptomEntries[index].name,
                              style: textTheme,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              onMoveUpPressed(index);
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_up,
                              color: buttonColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              onMoveDownPressed(index);
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: buttonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0.0,
                      thickness: 2.0,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                );
              },
            ),
          ),
          SymptomsBottomBar(
            onSymptomAddPressed: onSymptomAddPressed,
          ),
        ],
      ),
    );
  }

  void onDeletePressed(int index) {
    logger.debug("Symptom remove: $index");

    final symptomEntries =
        assessment.symptomEntries.copyWithRemovedEntry(index);
    updateSymptomEntries(symptomEntries);
  }

  void onMoveUpPressed(int index) {
    logger.debug("Symptom move up: $index");

    if (index == 0) {
      logger.warning("Cannot move up an item at index 0.");
      return;
    }

    final symptomEntries =
        assessment.symptomEntries.copyWithSwappedIndexes(index - 1, index);
    updateSymptomEntries(symptomEntries);
  }

  void onMoveDownPressed(int index) {
    logger.debug("Symptom move down: $index");

    if (index == assessment.symptomEntries.symptomEntries.length - 1) {
      logger.warning("Cannot move up an item at max index.");
      return;
    }

    final symptomEntries =
        assessment.symptomEntries.copyWithSwappedIndexes(index, index + 1);
    updateSymptomEntries(symptomEntries);
  }

  void onSymptomAddPressed(String value) {
    logger.debug("Symptom add: $value");
    value = value.trim();

    final validationErrorMessage = _validateSymptomToAdd(value);
    if (validationErrorMessage != null) {
      final theme = Theme.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            validationErrorMessage,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.background,
            ),
          ),
        ),
      );

      return;
    }

    final symptomEntries =
        assessment.symptomEntries.copyWithAdditionalEntry(value);
    updateSymptomEntries(symptomEntries);
  }

  void updateSymptomEntries(SymptomEntries symptomEntries) {
    final newAssessment = assessment.copyWith(symptomEntries: symptomEntries);
    setState(() {
      assessment = newAssessment;
    });

    widget.onDataChanged((assessment) {
      return newAssessment;
    });
  }

  String? _validateSymptomToAdd(String value) {
    // This should probably return an enum, but we're short on time so String is good enough
    if (value.isEmpty) {
      return "Nie można dodać pustego symptomu.";
    }

    final alreadyExists = assessment.symptomEntries.symptomEntries
        .any((element) => element.name == value);

    if (alreadyExists) {
      return "Symptom o tej nazwie już istnieje.";
    }

    return null;
  }
}
