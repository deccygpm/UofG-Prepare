import 'package:flutter/material.dart';
import 'package:uofg_prepare/main.dart';
import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/validation.dart';
import 'package:uofg_prepare/theme.dart';

import '../shared/shared.dart';

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
            const Headline(
              data: "Reset Password",
              color: Colors.white,
            ),
            Text(
              "Enter the email address you used to register below",
              style: TextStyle(color: themeGrey),
            ),
            Flexible(
              child: Padding(
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            ValidationService().validateEmail(email!)),
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
                backgroundColor: themeGrey,
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
