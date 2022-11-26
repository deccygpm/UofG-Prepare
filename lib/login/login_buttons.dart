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
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 3, color: Colors.black),
                borderRadius: BorderRadius.circular(3)),
            backgroundColor: Colors.white,
            onPressed: () => AuthService().guestLogin(),
            text: 'Continue as Guest',
            icon: Icons.person,
            fontSize: 14.0,
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
          SignInButton(Buttons.Google,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(3)),
              onPressed: () => AuthService().googleLogin()),
          if (Platform.isIOS)
            SignInButton(Buttons.Apple,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(3)),
                onPressed: () => AuthService().signInWithApple()),
        ],
      ),
    );
  }
}
