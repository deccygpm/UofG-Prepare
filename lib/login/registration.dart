import 'package:flutter/material.dart';
import 'package:l2_transition/shared/app_bar.dart';
import 'package:l2_transition/shared/headline.dart';

import '../services/auth.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Headline(data: "Register"),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                )),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Email"),
                )),
          ),
          const Divider(),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                )),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Password"),
                )),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          OutlinedButton(
            onPressed: () {
              AuthService().emailSignUp(email, password);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.black, width: 3),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
