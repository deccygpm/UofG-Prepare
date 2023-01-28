import 'package:flutter/material.dart';
import 'package:uofg_prepare/main.dart';
import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/validation.dart';
import 'package:uofg_prepare/shared/headline.dart';
import 'package:uofg_prepare/theme.dart';

class RegistrationScreen extends StatefulWidget {
  final PageController controller;

  const RegistrationScreen({super.key, required this.controller});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordMatchController = TextEditingController();
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
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          _RegisterForm(
              formKey: formKey,
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              passwordController: passwordController,
              passwordMatchController: passwordMatchController),
          _SignInLink(widget: widget),
        ],
      ),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    Key? key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordMatchController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordMatchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 20, right: 20),
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
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Center(
                    child: Headline(
                      data: 'Register',
                      color: themeGrey,
                    ),
                  ),
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
                      controller: firstNameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(labelText: "First Name"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                        controller: lastNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            const InputDecoration(labelText: "Last Name"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                            controller: passwordMatchController,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                                labelText: "Confirm Password"),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (repeatedPassword) => ValidationService()
                                .validatePasswordsMatch(passwordController.text,
                                    repeatedPassword!))),
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

                      AuthService().emailSignUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          firstNameController.text.trim(),
                          lastNameController.text.trim());

                      navigatorKey.currentState!.pop();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: themeGrey,
                      side: const BorderSide(color: Colors.black, width: 3),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInLink extends StatelessWidget {
  const _SignInLink({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final RegistrationScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(color: themeBlue, fontWeight: FontWeight.bold),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: themeBlue),
          onPressed: () {
            widget.controller.animateToPage(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn);
          },
          child: Text(
            "Click here to login",
            style: TextStyle(color: themeBlue),
          ),
        ),
      ],
    );
  }
}
