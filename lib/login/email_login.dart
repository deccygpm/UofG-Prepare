import 'package:flutter/material.dart';
import 'package:l2_transition/shared/app_bar.dart';
import 'package:l2_transition/shared/drawer.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          TextField(),
          TextField(),
        ],
      )
    );
  }
}
