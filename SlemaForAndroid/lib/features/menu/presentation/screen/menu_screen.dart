import 'package:flutter/material.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_option.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final service =
        Provider.of<ApplicationInfoRepository>(context, listen: false);
    return Column(
      children: [
        const WhiteAppBar(titleText: "Więcej"),
        SingleChildScrollView(
          child: Column(
            children: [
              const MenuScreenOption(
                iconData: Icons.medication_outlined,
                label: 'Lekarstwa',
                destinationIndex: 3,
              ),
              const MenuScreenOption(
                iconData: Icons.restaurant_menu_outlined,
                label: 'Dieta',
                destinationIndex: 4,
              ),
              const MenuScreenOption(
                iconData: Icons.fitness_center_outlined,
                label: 'Ćwiczenia',
                destinationIndex: 5,
              ),
              const MenuScreenOption(
                iconData: Icons.image,
                label: 'Zdjęcia',
                destinationIndex: 6,
              ),
              const MenuScreenOption(
                iconData: Icons.assessment_outlined,
                label: 'Raport',
                destinationIndex: 7,
              ),
              if (service.isDeveloperMode())
                const MenuScreenOption(
                  iconData: Icons.chat,
                  label: "Konsultacje",
                  destinationIndex: 8,
                ),
              if (service.isDeveloperMode())
                const MenuScreenOption(
                  iconData: Icons.settings,
                  label: "Ustawienia",
                  destinationIndex: 9,
                ),
              const MenuScreenOption(
                iconData: Icons.info_outline,
                label: "O aplikacji",
                destinationIndex: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
