import 'package:flutter/material.dart';
import 'package:l2_transition/services/local_data.dart';

class StudyMenuScreen extends StatefulWidget {
  const StudyMenuScreen({super.key});

  @override
  State<StudyMenuScreen> createState() => _StudyMenuScreenState();
}

class _StudyMenuScreenState extends State<StudyMenuScreen> {
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
