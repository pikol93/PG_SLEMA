import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_button.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_divider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 20.0),
            child: Text(
              "Więcej",
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize:
                        Theme.of(context).textTheme.displayLarge?.fontSize,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const MenuScreenButton(
          iconData: CustomIcons.medicineCapsules,
          label: 'Lekarstwa',
          destinationIndex: 3,
        ),
        const MenuScreenDivider(),
        const MenuScreenButton(
          iconData: CustomIcons.diet,
          label: 'Dieta',
          destinationIndex: 4,
        ),
        const MenuScreenDivider(),
        const MenuScreenButton(
          iconData: CustomIcons.award,
          label: 'Ćwiczenia',
          destinationIndex: 5,
        ),
        const MenuScreenDivider(),
        const MenuScreenButton(
          iconData: CustomIcons.photo,
          label: 'Zdjęcia',
          destinationIndex: 6,
        ),
        const MenuScreenDivider(),
        const MenuScreenButton(
          iconData: CustomIcons.medicalReport,
          label: 'Raport',
          destinationIndex: 7,
        ),
        const MenuScreenDivider()
      ],
    );
  }
}
