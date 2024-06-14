import 'package:flutter/material.dart';
import 'package:pg_slema/features/about/presentation/widget/application_section_widget.dart';
import 'package:pg_slema/features/about/presentation/widget/contact_section_widget.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WhiteAppBar(
          titleText: "O aplikacji",
        ),
        DefaultBody(
          mainWidgetsPaddingHorizontal: 0.0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ContactSectionWidget(),
                ApplicationSectionWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
