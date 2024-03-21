import 'package:flutter/material.dart';

import '../../../../../custom_icons_icons.dart';

class AddMedicineScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double _toolbarHeight = 170.0;
  final double _spaceBetweenBackIconAndTitle = 10.0;
  final double _titleHorizontalPadding = 14.0;

  const AddMedicineScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _toolbarHeight,
      automaticallyImplyLeading: false,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CustomIcons.arrow_left),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          SizedBox(height: _spaceBetweenBackIconAndTitle),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _titleHorizontalPadding),
            child: Text(
              "Dodaj",
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    height: 0.52381,
                  ),
            ),
          ),
          SizedBox(height: _spaceBetweenBackIconAndTitle),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _titleHorizontalPadding),
            child: Text(
              "lekarstwo",
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    height: 0.52381,
                  ),
            ),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/medicine/add_medicine_appbar_background.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_toolbarHeight);
}
