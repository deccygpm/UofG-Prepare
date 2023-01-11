import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class QuizCompleteScreen extends StatelessWidget {
  final String name;
  final Quiz quiz;
  const QuizCompleteScreen({super.key, required this.name, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Headline(data: 'Congratulations!', color: themeBlue),
          Text('You have completed the $name quiz! :)'),
          ElevatedButton(
            onPressed: () {
              FirestoreService().updateUserReport(quiz);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/selection', (route) => false);
            },
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }
}
