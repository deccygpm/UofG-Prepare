import 'package:flutter/material.dart';
import 'package:l2_transition/shared/shared.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(child: Text('hello')),
    );
  }
}
