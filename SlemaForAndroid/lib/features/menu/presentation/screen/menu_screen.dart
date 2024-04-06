import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/presentation/screen/all_threads_screen.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_button.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/menu_option_divider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WhiteAppBar(titleText: "Więcej"),
        MenuScreenButton(
          iconData: Icons.medication_outlined,
          label: 'Lekarstwa',
          destinationIndex: 3,
        ),
        MenuOptionDivider(),
        MenuScreenButton(
          iconData: Icons.restaurant_menu_outlined,
          label: 'Dieta',
          destinationIndex: 4,
        ),
        MenuOptionDivider(),
        MenuScreenButton(
          iconData: Icons.fitness_center_outlined,
          label: 'Ćwiczenia',
          destinationIndex: 5,
        ),
        MenuOptionDivider(),
        MenuScreenButton(
          iconData: Icons.image,
          label: 'Zdjęcia',
          destinationIndex: 6,
        ),
        MenuOptionDivider(),
        MenuScreenButton(
          iconData: Icons.assessment_outlined,
          label: 'Raport',
          destinationIndex: 7,
        ),
        MenuOptionDivider(),
        MenuScreenButton(
            iconData: Icons.chat, label: "Konsultacje", destinationIndex: 8),
        MenuOptionDivider(),
        MenuScreenButton(
          iconData: Icons.settings,
          label: "Ustawienia",
          destinationIndex: 9,
        ),
        MenuOptionDivider()
      ],
    );
  }
}
