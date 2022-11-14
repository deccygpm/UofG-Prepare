import 'package:flutter/material.dart';
import 'package:l2_transition/login/login.dart';
import 'package:l2_transition/selection/selection.dart';
import 'package:l2_transition/services/auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading");
          } else if (snapshot.hasError) {
            return const Text("error");
          } else if (snapshot.hasData) {
            return const SelectionScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
