import 'package:flutter/material.dart';

class MealIdeaIconButton extends StatelessWidget {
  const MealIdeaIconButton({super.key});

  void showMealIdea(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.cancel_outlined),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text("TODO projekt i implementacja"),
                ),
              ],
            ),
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
        Icons.question_mark_outlined,
        color: Colors.black,
      ),
    );
  }
}
