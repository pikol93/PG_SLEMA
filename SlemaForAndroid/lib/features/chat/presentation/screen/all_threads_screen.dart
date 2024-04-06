import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/presentation/controller/all_threads_screen_controller.dart';
import 'package:pg_slema/features/chat/presentation/screen/partial/available_threads.dart';
import 'package:pg_slema/features/chat/presentation/screen/partial/no_threads_found.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class AllThreadsScreen extends StatelessWidget {
  final AllThreadsScreenController controller = AllThreadsScreenController();
  AllThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WhiteAppBar(
          titleText: "Konsultacje",
        ),
        DefaultBody(
          child: Column(
            children: [
              if (controller.isAnyThreadAvailable())
                const AvailableThreads()
              else
                const NoThreadsFound(),
            ],
          ),
        ),
      ],
    );
  }
}
