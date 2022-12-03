import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/selection/selection.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/shared/utils.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isVerified = false;
  bool canResendEmail = false;
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

  Future emailResend() async {
    try {
      await AuthService().sendVerificationEmail();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(minutes: 1));
      setState(() => canResendEmail = true);
    } on FirebaseAuthException catch (e) {
      Utils.showErrorAlert(e.message);
    }
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? SelectionScreen()
      : Scaffold(
          appBar: const CustomAppBar(),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Headline(data: 'Verify Email', color: Colors.white),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5),
              child: Text(
                'A verification email has been sent.\nIf you have not receieved this email, click the button below to send another.',
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () => canResendEmail ? emailResend() : null,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black, width: 3),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Resend Verification Email",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () => AuthService().logOut(),
              ),
            ),
            const Spacer(flex: 2),
          ]),
        );
}
