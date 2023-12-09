import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DietAppBar(),
      ),
      body: const Center(
        child: Text("TODO"),
      ),
    );
  }
}
