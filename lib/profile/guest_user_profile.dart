import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/local_data.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class GuestUserProfileScreen extends StatelessWidget {
  const GuestUserProfileScreen({Key? key}) : super(key: key);

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
            'UofG',
            style: TextStyle(
                color: themeGrey, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          Headline(data: 'Hi, Guest', color: themeGrey),
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
                Text(
                  'You are currently on a guest account. To get the full experience of this app, please log out and register an account.',
                  style: TextStyle(
                    color: themeBlue,
                    fontSize: 16,
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
                    LocalData().clearAll();
                    AuthService().deleteUser();
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
                      'Delete Account',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
