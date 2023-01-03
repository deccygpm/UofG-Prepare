import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:l2_transition/services/local_data.dart';
import 'package:l2_transition/shared/app_bar.dart';

class SelectSectionScreen extends StatefulWidget {
  const SelectSectionScreen({super.key});

  @override
  State<SelectSectionScreen> createState() => _SelectSectionScreenState();
}

class _SelectSectionScreenState extends State<SelectSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(
            icon: Icon(Icons.grid_4x4_rounded), label: 'Prepare'),
        NavigationDestination(icon: Icon(Icons.quiz_rounded), label: 'Study'),
      ]),
      body: ElevatedButton(
        child: Text("clear prefs"),
        onPressed: () {
          LocalData().clearAll();
          Navigator.pushNamedAndRemoveUntil(
              context, '/selection', (route) => false);
        },
      ),
    );
  }
}
