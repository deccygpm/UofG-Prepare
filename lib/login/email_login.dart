import 'package:flutter/material.dart';
import 'package:l2_transition/shared/shared.dart';

import '../services/auth.dart';

class EmailLoginScreen extends StatelessWidget {
  EmailLoginScreen({
    Key? key,
  }) : super(key: key);

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Headline(data: "Sign In"),
            const Divider(
              color: Colors.transparent,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
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
                )),
            const Divider(),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
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
                        decoration:
                            const InputDecoration(labelText: "Password"),
                      )),
                )),
            const Divider(
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: OutlinedButton(
                onPressed: () async {
                  await AuthService().emailSignIn(email, password);
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
          ],
        ));
  }
}
