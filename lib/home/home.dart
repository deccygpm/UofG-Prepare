import 'package:flutter/material.dart';
import 'package:l2_transition/login/auth_wrapper.dart';
import 'package:l2_transition/login/email_verification.dart';
import 'package:l2_transition/services/auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text("error");
          } else if (snapshot.hasData) {
            return const EmailVerificationScreen();
          } else {
            return const AuthScreen();
          }
        });
  }
}
