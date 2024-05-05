import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service_impl.dart';
import 'package:pg_slema/features/chat/presentation/screen/partial/available_threads.dart';
import 'package:pg_slema/features/chat/presentation/screen/partial/no_threads_found.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/features/chat/logic/repository/threads/threads_repository_impl.dart';

class AllThreadsScreen extends StatelessWidget {
  final ThreadsService threadsService =
      ThreadsServiceImpl(ThreadsRepositoryImpl());
  AllThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WhiteAppBar(
          titleText: "Konsultacje",
        ),
        if (threadsService.isAnyThreadAvailable()) ...[
          AvailableThreads(threadsService: threadsService),
        ] else ...[
          const DefaultBody(child: NoThreadsFound()),
        ]
      ],
    );
  }
}
