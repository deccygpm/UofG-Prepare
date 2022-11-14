import 'package:flutter/material.dart';
import '../shared/shared.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text("hello"),
          ),
        ),
        drawer: const CustomDrawer());
  }
}
