import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:pg_slema/utils/widgets/dividers/labeled_section_divider.dart';

class LoginView extends StatelessWidget {
  final Function onGoogleSignInPressed;
  const LoginView({super.key, required this.onGoogleSignInPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LabeledSectionDivider(label: "Zaloguj się"),
        Container(height: 20),
        SignInButton(
          Buttons.Google,
          onPressed: onGoogleSignInPressed,
        ),
      ],
    );
  }
}
