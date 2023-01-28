import 'package:flutter/material.dart';
import 'package:uofg_prepare/main.dart';
import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/validation.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class ResetPasswordModal extends StatefulWidget {
  const ResetPasswordModal({super.key});

  @override
  State<ResetPasswordModal> createState() => _ResetPasswordModalState();
}

class _ResetPasswordModalState extends State<ResetPasswordModal> {
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Headline(
              data: 'Update Password',
              color: themeGrey,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: themeGrey,
                border: Border.all(),
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) =>
                    ValidationService().validatePassword(password!),
                controller: passwordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  label: Text(
                    'Enter New Password',
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: themeGrey,
                border: Border.all(),
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (repeatPassword) => ValidationService()
                    .validatePasswordsMatch(
                        passwordController.text, repeatPassword!),
                controller: verifyPasswordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  label: Text(
                    'Repeat New Password',
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.transparent,
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

                AuthService().updatePassword(passwordController.text.trim());

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
