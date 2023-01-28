import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/local_data.dart';
import 'package:uofg_prepare/services/models.dart';

import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class GuestUserProfileScreen extends StatelessWidget {
  const GuestUserProfileScreen({Key? key, required this.user})
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
              children: [
                Headline(data: "Hi, Guest", color: themeBlue),
                const Text(
                    "If you want the full experience of this app, please sign out and register a full account."),
                Image.asset(
                  'assets/image/uofg-logo-large.jpg',
                  scale: 3,
                ),
                SignInButtonBuilder(
                  backgroundColor: Colors.white,
                  onPressed: () async {
                    LocalData().clearAll();
                    AuthService().logOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  text: "Logout",
                  icon: Icons.verified_user_outlined,
                  iconColor: Colors.black,
                  textColor: Colors.black,
                )
              ],
            ))));
  }
}
