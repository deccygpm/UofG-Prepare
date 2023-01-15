import 'package:flutter/material.dart';

import 'package:l2_transition/shared/app_bar.dart';

class SocialsScreen extends StatelessWidget {
  const SocialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text('socials'),
    );
  }
}
