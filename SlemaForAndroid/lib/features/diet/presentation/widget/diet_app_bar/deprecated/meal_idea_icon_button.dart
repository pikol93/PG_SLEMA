import 'package:flutter/material.dart';

import 'package:pg_slema/custom_icons_icons.dart';

class MealIdeaIconButton extends StatelessWidget {
  const MealIdeaIconButton({super.key});

  void showMealIdea(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(CustomIcons.remove),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("TODO projekt i implementacja"),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(CustomIcons.questionMark),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showMealIdea(context);
      },
      icon: const Icon(
        CustomIcons.questionMark,
        color: Colors.black,
      ),
    );
  }
}
