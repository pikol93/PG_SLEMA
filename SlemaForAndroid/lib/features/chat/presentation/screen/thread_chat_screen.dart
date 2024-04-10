import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class ThreadChatScreen extends StatelessWidget {
  const ThreadChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DefaultAppBar(title: "Nazwa watku TODO"),
        DefaultBody(child: Text("TODO")),
      ],
    );
  }
}
