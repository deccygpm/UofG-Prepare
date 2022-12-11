import 'package:flutter/material.dart';
import 'package:l2_transition/login/auth_wrapper.dart';
import 'package:l2_transition/login/email_verification.dart';
import 'package:l2_transition/selection/selection.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/loading.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Text("error");
          } else if (snapshot.hasData) {
            if (snapshot.data!.email == null) {
              return const SelectionScreen();
            } else if (!snapshot.data!.emailVerified) {
              return const EmailVerificationScreen();
            } else {
              return const SelectionScreen();
            }
          } else {
            return const AuthScreen();
          }
        });
  }
}
