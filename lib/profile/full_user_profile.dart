import 'package:flutter/material.dart';
import 'package:uofg_prepare/profile/confirmation_modal.dart';
import 'package:uofg_prepare/profile/reset_password.dart';

import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/local_data.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class UserWithFullProfileScreen extends StatelessWidget {
  const UserWithFullProfileScreen({Key? key, required this.user})
      : super(key: key);

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: themeBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            'UofG Prepare',
            style: TextStyle(
                color: themeGrey, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          Headline(data: 'Hi, ${user.firstName}', color: themeGrey),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Colors.transparent,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: ((BuildContext context) {
                          return AlertDialog(
                              backgroundColor: themeBlue,
                              content: const ResetPasswordModal());
                        }));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: const Text(
                      'Update Password',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                GestureDetector(
                  onTap: () {
                    LocalData().clearAll();
                    AuthService().logOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: const Text(
                      'Logout',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: ((BuildContext context) {
                          return AlertDialog(
                            backgroundColor: themeBlue,
                            content: const ConfirmationModal(),
                          );
                        }));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: const Text(
                      'Delete Account',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
