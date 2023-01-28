import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/local_data.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class ConfirmationModal extends StatelessWidget {
  const ConfirmationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Headline(data: 'Delete Account', color: themeGrey),
        const Divider(
          color: Colors.transparent,
        ),
        Text(
          'Are you sure you want to delete your account?',
          style: TextStyle(
              color: themeGrey, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Divider(
          color: Colors.transparent,
        ),
        Text(
          'This action is irreversible, only click the button below if you are certain you wish to permanently delete your account',
          style: TextStyle(
              color: themeGrey, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Divider(
          color: Colors.transparent,
        ),
        OutlinedButton(
          onPressed: () {
            LocalData().clearAll();
            AuthService().deleteUser();
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: themeGrey,
            side: const BorderSide(color: Colors.black, width: 3),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Permanently Delete Account",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
