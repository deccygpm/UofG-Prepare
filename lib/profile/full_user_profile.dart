import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';

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
              children: [
                Text(user!.firstName),
                Image.asset(
                  'assets/image/uofg-logo-large.jpg',
                  scale: 3,
                ),
                SignInButtonBuilder(
                  backgroundColor: Colors.white,
                  onPressed: () async {
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
