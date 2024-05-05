import 'package:flutter/material.dart';
import 'package:pg_slema/features/settings/presentation/screen/developer_settings_screen.dart';
import 'package:pg_slema/utils/widgets/dividers/menu_option_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/navigator_push_link_button.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Ustawienia"),
        DefaultBody(
          mainWidgetsPaddingHorizontal: 0.0,
          child: Column(
            children: [
              NavigatorPushLinkButton(
                iconData: Icons.build,
                label: 'Development',
                builder: (BuildContext context) {
                  return const DeveloperSettingsScreen();
                },
              ),
              const MenuOptionDivider(),
            ],
          ),
        ),
      ],
    );
  }
}
