import 'package:flutter/material.dart';
import 'package:l2_transition/login/login.dart';
import 'package:l2_transition/login/register.dart';
import 'package:l2_transition/shared/app_bar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            LoginScreen(
              controller: controller,
            ),
            RegistrationScreen(
              controller: controller,
            ),
          ],
        ));
  }
}
