import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/presentation/widget/available_thread_overview.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/dividers/labeled_section_divider.dart';
import 'package:pg_slema/features/chat/logic/service/threads_service.dart';
import 'package:pg_slema/features/chat/logic/entity/thread.dart';

class AvailableThreads extends StatelessWidget {
  final ThreadsService threadsService;
  const AvailableThreads({super.key, required this.threadsService});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const LabeledSectionDivider(label: "Dzienny raport zdrowotny"),
          DefaultBody(
            child: FutureBuilder(
              future: threadsService.getAll(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Thread>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AvailableThreadOverview(
                          thread: snapshot.data!.elementAt(index));
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error...');
                } else {
                  return const Text('Awaiting result...');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
