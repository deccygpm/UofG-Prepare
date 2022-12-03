import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../services/auth.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SignInButtonBuilder(
            elevation: 2,
            backgroundColor: Colors.white,
            onPressed: () => AuthService().guestLogin(),
            text: 'Continue as Guest',
            icon: Icons.person,
            fontSize: 14.0,
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
          SignInButton(
            Buttons.Google,
            elevation: 2,
            onPressed: () => AuthService().googleLogin(),
          ),
          if (Platform.isIOS)
            SignInButton(Buttons.Apple,
                elevation: 2, onPressed: () => AuthService().signInWithApple()),
        ],
      ),
    );
  }
}
