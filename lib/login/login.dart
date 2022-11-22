import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:l2_transition/shared/shared.dart';

import '../services/auth.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Headline(data: "Sign In"),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 3.0,
                  )),
              child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: "Email"),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    )),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: "Password"),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: OutlinedButton(
                onPressed: () => AuthService().emailSignIn(email, password),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black, width: 3),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const Headline(
              data: "Or",
            ),
            Center(
              child: Column(
                children: [
                  SignInButtonBuilder(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(3)),
                    backgroundColor: Colors.white,
                    onPressed: () => AuthService().guestLogin(),
                    text: 'Continue as Guest',
                    icon: Icons.person,
                    fontSize: 14.0,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                  ),
                  SignInButton(Buttons.Google,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () => AuthService().googleLogin()),
                  if (Platform.isIOS)
                    SignInButton(Buttons.Apple,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(3)),
                        onPressed: () => AuthService().signInWithApple()),
                  const Divider(
                    color: Colors.black,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/login/register'),
                      child: const Text(
                        "Click here to Register",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ),
          ]),
        ));
  }
}
