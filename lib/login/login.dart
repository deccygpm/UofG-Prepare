import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/login/forgot_password.dart';
import 'package:l2_transition/login/login_buttons.dart';
import 'package:l2_transition/login/register_link.dart';
import 'package:l2_transition/main.dart';
import 'package:l2_transition/services/validation.dart';
import 'package:l2_transition/shared/shared.dart';

import '../services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

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
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Headline(data: "Sign In"),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          color: Colors.white,
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
                            decoration:
                                const InputDecoration(labelText: "Password"),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (password) =>
                                ValidationService().validatePassword(password!),
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
                            final isValid = formKey.currentState!.validate();
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
                            backgroundColor: Colors.white,
                            side:
                                const BorderSide(color: Colors.black, width: 3),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  backgroundColor:
                                      Color.fromARGB(255, 205, 205, 205),
                                  content: ForgottenPasswordModal(),
                                );
                              });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const Headline(data: 'Or'),
            const LoginButtons(),
            const Divider(color: Colors.black),
            const RegisterLink(),
          ]),
        ));
  }
}
