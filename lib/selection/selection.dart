import 'package:flutter/material.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/shared.dart';

class SelectionScreen extends StatelessWidget {
  SelectionScreen({super.key});
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(), body: Center(child: Text("selection page")));
  }
}
