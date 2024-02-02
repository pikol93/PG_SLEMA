import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/diet_screen_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/diet_app_bar.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late DietScreenController controller;

  @override
  void initState() {
    controller = DietScreenController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DietAppBar(onDateChanged: _onDateChanged),
      ),
      body: const Center(
        child: Text("TODO"),
      ),
    );
  }

  void _onDateChanged(DateTime date) {
    controller.onDateChanged(date);
    setState(() {});
  }
}
