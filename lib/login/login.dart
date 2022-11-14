import 'package:flutter/material.dart';
import 'package:l2_transition/shared/shared.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Center(
          child: ElevatedButton(
        child: const Text("bonjour"),
        onPressed: () => Navigator.pop(context),
      )),
    );
  }
}
