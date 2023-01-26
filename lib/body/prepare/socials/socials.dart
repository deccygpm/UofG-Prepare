import 'package:flutter/material.dart';

import 'package:uofg_prepare/shared/app_bar.dart';

class SocialsScreen extends StatelessWidget {
  const SocialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Text('socials'),
    );
  }
}
