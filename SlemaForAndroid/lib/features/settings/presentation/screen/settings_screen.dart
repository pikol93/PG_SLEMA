import 'package:flutter/material.dart';
import 'package:pg_slema/features/settings/presentation/screen/developer_settings_screen.dart';
import 'package:pg_slema/utils/widgets/menu_option_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/navigator_push_link_button.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
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
                iconData: Icons.accessible_forward,
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
