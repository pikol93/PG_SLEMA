import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/select_dishes_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/save_button.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesScreen extends StatefulWidget {
  final ValueChanged<Map<MealTime, List<Dish>>> onDishesSelected;
  final ValueGetter<Map<MealTime, List<Dish>>> initDishesProvider;

  const SelectDishesScreen(
      {super.key,
      required this.onDishesSelected,
      required this.initDishesProvider});

  @override
  State<StatefulWidget> createState() => _SelectDishesScreenState();
}

class _SelectDishesScreenState extends State<SelectDishesScreen> {
  late final SelectDishesController controller;

  @override
  void initState() {
    super.initState();
    controller =
        SelectDishesController(_onDishesChanged, widget.initDishesProvider());
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edytuj posiłki"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomSaveButton(
                  onSaveButtonClicked:
                      () {}) //TODO onDishesSelected from controller
            ],
          ),
        ));
  }

  void _onDishesChanged() {
    setState(() {});
  }
}
