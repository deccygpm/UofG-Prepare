import 'package:flutter/material.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/app_bar.dart';

class EmailRegistrationScreen extends StatelessWidget {
  EmailRegistrationScreen({Key? key}) : super(key: key);

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () => {AuthService().emailSignUp(email, password)},
              child: const Text("Register"))
        ],
      )
    );
  }
}
