import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/main.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/services/validation.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class RegistrationScreen extends StatefulWidget {
  final Function() onClickedSignIn;

  const RegistrationScreen({super.key, required this.onClickedSignIn});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RegExp regex = RegExp(r'^(?=.*?[A-Z]).{8,}$');

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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headline(
                  data: 'Register',
                  color: themeGrey,
                ),
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
                          decoration: const InputDecoration(labelText: "Email"),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            validator: (password) => ValidationService()
                                .validatePassword(password!))),
                  ),
                ),
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

                      AuthService().emailSignUp(emailController.text.trim(),
                          passwordController.text.trim());

                      navigatorKey.currentState!.pop();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black, width: 3),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Center(
                  heightFactor: 2,
                  child: RichText(
                      text: TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: "Click here to Sign In",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                      ])),
                )
              ],
            ),
          ),
        ));
  }
}
