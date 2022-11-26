import 'package:flutter/material.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({
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
              "Don't have an account?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
    );
  }
}
