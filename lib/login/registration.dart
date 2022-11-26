import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/login/login_link.dart';
import 'package:l2_transition/main.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/shared.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

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
                const Headline(data: 'Register'),
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
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      )),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password) => password != null &&
                                  !(regex.hasMatch(password))
                              ? 'Password must be at least 8 characters.\nPassword must contain at least one uppercase letter.'
                              : null,
                        )),
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
                const LoginLink(),
              ],
            ),
          ),
        ));
  }
}
