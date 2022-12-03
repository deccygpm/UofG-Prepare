import 'package:flutter/material.dart';
import 'package:l2_transition/login/forgot_password.dart';
import 'package:l2_transition/login/login_buttons.dart';
import 'package:l2_transition/main.dart';
import 'package:l2_transition/services/validation.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

import '../services/auth.dart';

class LoginScreen extends StatefulWidget {
  final PageController controller;

  const LoginScreen({Key? key, required this.controller}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.all(10),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Headline(data: "Sign In", color: themeGrey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: themeGrey,
                            border: Border.all(
                              color: Colors.black,
                              width: 3.0,
                            )),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                    const InputDecoration(labelText: "Email"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (email) =>
                                    ValidationService().validateEmail(email!))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: themeGrey,
                              border: Border.all(
                                color: Colors.black,
                                width: 3.0,
                              )),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                decoration: const InputDecoration(
                                    labelText: "Password"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (password) => ValidationService()
                                    .validatePassword(password!),
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: OutlinedButton(
                              onPressed: () {
                                final isValid =
                                    formKey.currentState!.validate();
                                if (!isValid) return;

                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) => const Center(
                                          child: CircularProgressIndicator(),
                                        ));

                                AuthService().emailSignIn(
                                    emailController.text.trim(),
                                    passwordController.text.trim());

                                navigatorKey.currentState!
                                    .popUntil((route) => route.isFirst);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: themeGrey,
                                side: const BorderSide(
                                    color: Colors.black, width: 3),
                              ),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: themeGrey,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: themeBlue,
                                      content: const ForgottenPasswordModal(),
                                    );
                                  });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const LoginButtons(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(fontWeight: FontWeight.bold, color: themeBlue),
              ),
              TextButton(
                  style: TextButton.styleFrom(foregroundColor: themeBlue),
                  onPressed: () {
                    widget.controller.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: const Text("Click here to register"))
            ],
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
