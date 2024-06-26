import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/logic/repository/stomp_client_factory.dart';
import 'package:pg_slema/features/chat/presentation/controller/add_thread_controller.dart';
import 'package:pg_slema/features/chat/presentation/screen/add_thread_screen.dart';
import 'package:pg_slema/features/chat/presentation/widget/available_thread_overview.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body_with_floating_action_button.dart';
import 'package:pg_slema/utils/widgets/dividers/labeled_section_divider.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/thread.dart';
import 'package:pg_slema/utils/widgets/vertically_centered/vertically_centered_spinkit.dart';
import 'package:pg_slema/utils/widgets/vertically_centered/vertically_centered_text_information.dart';
import 'package:pg_slema/features/chat/presentation/screen/thread_chat_screen.dart';
import 'package:provider/provider.dart';

class AvailableThreads extends StatefulWidget {
  final ThreadsService threadsService;

  const AvailableThreads({super.key, required this.threadsService});

  @override
  State<AvailableThreads> createState() => _AvailableThreadsState();
}

class _AvailableThreadsState extends State<AvailableThreads> {
  late Future<List<Thread>> _getThreads;

  @override
  void initState() {
    super.initState();
    _getThreads = widget.threadsService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const LabeledSectionDivider(label: "Dostępne wątki"),
          Container(height: 10),
          FutureBuilder(
            future: _getThreads,
            builder:
                (BuildContext context, AsyncSnapshot<List<Thread>> snapshot) {
              if (snapshot.hasData) {
                return DefaultBodyWithFloatingActionButton(
                  onFloatingButtonPressed: _openAddingMedicinesScreen,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AvailableThreadOverview(
                        thread: snapshot.data!.elementAt(index),
                        onThreadPressed: () => _onThreadPressed(
                            snapshot.data!.elementAt(index).id,
                            snapshot.data!.elementAt(index).title),
                      );
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
                  child: VerticallyCenteredSpinkit(),
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
          threadsService: widget.threadsService,
          onThreadAdded: _reloadThreads,
        ),
      ),
    );
  }

  void _reloadThreads() {
    setState(() {
      _getThreads = widget.threadsService.getAll();
    });
  }

  void _onThreadPressed(String threadID, String threadTitle) {
    final stompClientFactory = Provider.of<StompClientFactory>(
      context,
      listen: false,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThreadChatScreen(
          threadID: threadID,
          threadTitle: threadTitle,
          stompClientFactory: stompClientFactory,
        ),
      ),
    );
  }
}
