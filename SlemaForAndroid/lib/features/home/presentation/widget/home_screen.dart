import 'package:flutter/material.dart';
import 'package:pg_slema/features/home/presentation/widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE7ECEF), //TODO
      child: const Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          HomeAppBar(),
        ],
      ),
    );
  }
}
