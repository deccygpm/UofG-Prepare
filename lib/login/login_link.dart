import 'package:flutter/material.dart';

class LoginLink extends StatelessWidget {
  const LoginLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text(
                  "Click here to Login",
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                )),
          ],
        ),
      ),
    );
  }
}
