import 'package:flutter/material.dart';
import 'package:uofg_prepare/login/login.dart';
import 'package:uofg_prepare/login/register.dart';
import 'package:uofg_prepare/shared/shared.dart';

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
