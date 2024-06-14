import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/settings/presentation/widget/change_server_ip_server_text.dart';
import 'package:pg_slema/features/settings/presentation/widget/disable_developer_mode_setting_button.dart';
import 'package:pg_slema/features/settings/presentation/widget/remove_assessments_setting_button.dart';
import 'package:pg_slema/features/settings/presentation/widget/remove_exercises_setting_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class DeveloperSettingsScreen extends StatefulWidget {
  const DeveloperSettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => DeveloperSettingsScreenState();
}

class DeveloperSettingsScreenState extends State<DeveloperSettingsScreen>
    with Logger {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DefaultAppBar(title: "Development"),
        DefaultBody(
          mainWidgetsPaddingHorizontal: 0.0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 0.0),
            child: Column(
              children: [
                RemoveAssessmentsSettingButton(),
                RemoveExercisesSettingButton(),
                ChangeServerAddressSettingText(),
                DisableDeveloperModeSettingButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
