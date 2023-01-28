import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/body_wrapper.dart';
import 'package:uofg_prepare/login/auth_wrapper.dart';
import 'package:uofg_prepare/login/email_verification.dart';
import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/shared/shared.dart';

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
              return const SelectionWrapper();
            } else if (!snapshot.data!.emailVerified) {
              return const EmailVerificationScreen();
            } else {
              return const SelectionWrapper();
            }
          } else {
            return const AuthScreen();
          }
        });
  }
}
