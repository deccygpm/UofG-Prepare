import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/main.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/shared.dart';

class ForgottenPasswordModal extends StatefulWidget {
  const ForgottenPasswordModal({super.key});

  @override
  State<ForgottenPasswordModal> createState() => _ForgottenPasswordModalState();
}

class _ForgottenPasswordModalState extends State<ForgottenPasswordModal> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Headline(data: "Forgotten Password"),
            const Text(
                "Enter the email address you used to register your account with below."),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: DecoratedBox(
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
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(labelText: "Email"),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                  ),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                final isValid = formKey.currentState!.validate();
                if (!isValid) return;

                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ));

                AuthService().forgottenPassword(emailController.text.trim());

                navigatorKey.currentState!.popUntil((route) => route.isFirst);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ]),
    );
  }
}
