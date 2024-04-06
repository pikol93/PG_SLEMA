import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/dividers/labeled_section_divider.dart';
import 'package:pg_slema/features/chat/logic/service/threads_service.dart';
import 'package:pg_slema/features/chat/logic/entity/thread.dart';

class AvailableThreads extends StatelessWidget {
  final ThreadsService threadsService;
  const AvailableThreads({super.key, required this.threadsService});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LabeledSectionDivider(label: "Dzienny raport zdrowotny"),
        Container(height: 5.0),
        FutureBuilder(
          future: threadsService.getAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Thread>> snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data!.elementAt(index).title),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('Error...');
            } else {
              return const Text('Awaiting result...');
            }
          },
        ),
      ],
    );
  }
}
