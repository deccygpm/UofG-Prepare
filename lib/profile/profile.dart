import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/shared.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(children: [
            Image.asset(
              'assets/image/uofg-logo-large.jpg',
              scale: 3,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: const Text("Logout")),
          ]),
        ),
      ),
    );
  }
}
