import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/shared.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          return Scaffold(
              appBar: const CustomAppBar(),
              drawer: const CustomDrawer(),
              body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                      child: Column(
                    children: [
                      Image.asset(
                        'assets/image/uofg-logo-large.jpg',
                        scale: 3,
                      ),
                      SignInButtonBuilder(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
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
        });
  }
}
