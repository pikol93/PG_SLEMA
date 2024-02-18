import 'package:flutter/material.dart';

class SelectDishesScreen extends StatefulWidget {
  const SelectDishesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SelectDishesScreenState();
}

class _SelectDishesScreenState extends State<SelectDishesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edytuj posiłki"),
          centerTitle: true,
        ),
        body: Text("todo"));
  }
}
