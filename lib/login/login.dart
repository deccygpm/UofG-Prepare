import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:l2_transition/shared/shared.dart';

import '../services/auth.dart';

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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Headline(data: "Sign In"),
              const Divider(
                color: Colors.transparent,
              ),
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
              const Divider(
                color: Colors.black,
              ),
              const Headline(
                data: "Or",
              ),
              SignInButtonBuilder(
                backgroundColor: Colors.white,
                onPressed: () => AuthService().guestLogin(),
                text: 'Continue as Guest',
                icon: Icons.person,
                fontSize: 14.0,
                iconColor: Colors.black,
                textColor: Colors.black,
              ),
              SignInButton(Buttons.Google,
                  onPressed: () => AuthService().googleLogin()),
              if (Platform.isIOS)
                SignInButton(Buttons.Apple,
                    onPressed: () => AuthService().signInWithApple()),
              const Divider(
                color: Colors.black,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Center(
                    child: Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              Center(
                child: TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/login/register'),
                    child: const Text(
                      "Click here to Register",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    )),
              )
            ],
          ),
        ));
  }
}
