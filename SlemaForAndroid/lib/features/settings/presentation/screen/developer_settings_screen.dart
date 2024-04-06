import 'package:flutter/cupertino.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class DeveloperSettingsScreen extends StatefulWidget {
  const DeveloperSettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => DeveloperSettingsScreenState();
}

class DeveloperSettingsScreenState extends State<DeveloperSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DefaultAppBar(title: "Development"),
        DefaultBody(
          child: Column(
            children: [
              Text("TODO"),
            ],
          ),
        ),
      ],
    );
  }
}
