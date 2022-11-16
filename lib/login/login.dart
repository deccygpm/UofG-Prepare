import 'package:flutter/material.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            SignInButtonBuilder(
              backgroundColor: Colors.white,
              onPressed: () async {
                await authService.guestLogin();
              },
              text: 'Guest',
              icon: Icons.verified_user_rounded,
              fontSize: 14.0,
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
            SignInButton(Buttons.Google, onPressed: () async {
              await authService.googleLogin();
            }),
            SignInButton(
              Buttons.Apple,
              onPressed: () async {
                await authService.signInWithApple();
              },
            ),
          ],
        ),
      ),
    );
  }
}
