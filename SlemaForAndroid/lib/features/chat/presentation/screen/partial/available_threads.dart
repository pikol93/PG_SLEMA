import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/presentation/controller/add_thread_controller.dart';
import 'package:pg_slema/features/chat/presentation/screen/add_thread_screen.dart';
import 'package:pg_slema/features/chat/presentation/widget/available_thread_overview.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body_with_floating_action_button.dart';
import 'package:pg_slema/utils/widgets/dividers/labeled_section_divider.dart';
import 'package:pg_slema/features/chat/logic/service/threads_service.dart';
import 'package:pg_slema/features/chat/logic/entity/thread.dart';
import 'package:pg_slema/utils/widgets/vertically_centered_information.dart';

class AvailableThreads extends StatefulWidget {
  final ThreadsService threadsService;
  const AvailableThreads({super.key, required this.threadsService});

  @override
  State<AvailableThreads> createState() => _AvailableThreadsState();
}

class _AvailableThreadsState extends State<AvailableThreads> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const LabeledSectionDivider(label: "Dostępne wątki"),
          FutureBuilder(
            future: widget.threadsService.getAll(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Thread>> snapshot) {
              if (snapshot.hasData) {
                return DefaultBodyWithFloatingActionButton(
                  onFloatingButtonPressed: _openAddingMedicinesScreen,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AvailableThreadOverview(
                          thread: snapshot.data!.elementAt(index));
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return const DefaultBody(
                  child: VerticallyCenteredTextInformation(
                      textInformation: 'Błąd podczas pobierania informacji...'),
                );
              } else {
                return const DefaultBody(
                  child: VerticallyCenteredTextInformation(
                      textInformation: 'Próbuję pobrać informacje...'),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _openAddingMedicinesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddThreadScreen(
          controller: AddThreadController(),
        ),
      ),
    );
  }
}
