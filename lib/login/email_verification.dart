import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/selection/selection.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/shared/utils.dart';
import 'package:l2_transition/theme.dart';

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
          appBar: CustomAppBar(),
          body: Column(children: [
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 3,
                    ),
                  ],
                  color: themeBlue,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(children: [
                  Headline(data: "Verify Email", color: themeGrey),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Text(
                      'A verification email has been sent.\nIf you have not receieved this email, click the button below to send another.',
                      style: TextStyle(color: themeGrey),
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
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: themeGrey,
                            decoration: TextDecoration.underline),
                      ),
                      onPressed: () => AuthService().logOut(),
                    ),
                  ),
                ]),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ]),
        );
}
