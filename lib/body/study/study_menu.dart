import 'package:flutter/material.dart';
import 'package:l2_transition/services/local_data.dart';
import 'package:l2_transition/theme.dart';

class StudyMenuScreen extends StatefulWidget {
  const StudyMenuScreen({super.key});

  @override
  State<StudyMenuScreen> createState() => _StudyMenuScreenState();
}

class _StudyMenuScreenState extends State<StudyMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Material(
              color: themeBlue,
              child: TabBar(
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(
                    text: 'Programming',
                  ),
                  Tab(
                    text: 'Python',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
