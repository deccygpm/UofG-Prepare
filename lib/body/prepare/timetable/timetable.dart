import 'package:flutter/material.dart';
import 'package:l2_transition/shared/app_bar.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Text('timetable'),
    );
  }
}
