import 'package:flutter/material.dart';

import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/app_bar.dart';
import 'package:uofg_prepare/theme.dart';

class UserWithFullProfileScreen extends StatelessWidget {
  const UserWithFullProfileScreen({Key? key, required this.user})
      : super(key: key);

  final AppUser? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
                child: Column(
              children: const [
                BlueBox(),
              ],
            ))));
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(10),
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
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    )),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: themeGrey,
                      minimumSize: const Size.fromHeight(60)),
                  onPressed: () {
                    AuthService().logOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    )),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: themeGrey,
                      minimumSize: const Size.fromHeight(60)),
                  onPressed: () {
                    AuthService().logOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    )),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: themeGrey,
                      minimumSize: const Size.fromHeight(60)),
                  onPressed: () {
                    AuthService().logOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
