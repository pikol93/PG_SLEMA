import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class AddThreadScreen extends StatelessWidget {
  const AddThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Dodaj wątek"),
        DefaultBody(child: Container()),
      ],
    );
  }
}
