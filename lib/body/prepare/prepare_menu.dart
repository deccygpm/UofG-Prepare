import 'package:flutter/material.dart';
import 'package:l2_transition/services/local_data.dart';

class PrepareMenuScreen extends StatefulWidget {
  const PrepareMenuScreen({super.key});

  @override
  State<PrepareMenuScreen> createState() => _PrepareMenuScreenState();
}

class _PrepareMenuScreenState extends State<PrepareMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("clear prefs"),
      onPressed: () {
        LocalData().clearAll();
        Navigator.pushNamedAndRemoveUntil(
            context, '/selection', (route) => false);
      },
    );
  }
}
