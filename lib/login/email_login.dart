import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:l2_transition/shared/shared.dart';

import '../services/auth.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Headline(data: "Sign In"),
            Divider(
              color: Colors.transparent,
            ),
            const InputBox(
              label: 'Email',
              isObscure: false,
              keyboard: TextInputType.emailAddress,
            ),
            const Divider(),
            const InputBox(
              label: 'Password',
              isObscure: true,
              keyboard: TextInputType.text,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: SignInButtonBuilder(
                backgroundColor: Colors.white,
                icon: Icons.check_rounded,
                iconColor: Colors.black,
                onPressed: () async {
                  AuthService().emailSignIn;
                },
                text: 'Log In',
                textColor: Colors.black,
              ),
            ),
          ],
        ));
  }
}
