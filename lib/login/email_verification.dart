import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l2_transition/selection/selection.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/app_bar.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isVerified = AuthService().user!.emailVerified;

    if (!isVerified) {
      AuthService().sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await AuthService().user!.reload();
    setState(() {
      isVerified = AuthService().user!.emailVerified;
    });

    if (isVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? SelectionScreen()
      : const Scaffold(
          appBar: CustomAppBar(),
          body: Center(
            child: Text('verify me'),
          ),
        );
}
