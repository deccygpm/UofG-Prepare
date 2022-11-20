import 'package:flutter/material.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/shared/app_bar.dart';
import 'package:l2_transition/shared/headline.dart';

class EmailRegistrationScreen extends StatelessWidget {
  const EmailRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(children: const [
        Headline(data: "Register"),
      ]),
    );
  }
}
