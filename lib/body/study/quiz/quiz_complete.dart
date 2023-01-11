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
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
      color: themeBlue,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ],
          color: themeGrey,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Headline(data: 'Congratulations!', color: themeBlue)),
            const Divider(color: Colors.transparent),
            Image.asset('assets/image/programming/fireworks.gif'),
            const Divider(
              color: Colors.transparent,
            ),
            Text(
              'You have completed the $name quiz!',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            OutlinedButton(
              onPressed: () {
                FirestoreService().updateUserReport(quiz);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/selection', (route) => false);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: themeGrey,
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: const Text(
                "Finish",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
