import 'package:flutter/material.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/services/auth.dart';

class SelectionScreen extends StatelessWidget {
  SelectionScreen({super.key});
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  await authService.logout();
                },
                child: const Text("logout"))));
  }
}
