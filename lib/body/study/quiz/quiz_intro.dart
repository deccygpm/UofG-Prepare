import 'package:flutter/material.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';
import 'package:provider/provider.dart';

import 'quiz_state.dart';

class QuizIntroScreen extends StatelessWidget {
  final String name;
  const QuizIntroScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return ChangeNotifierProvider(
        create: (_) => QuizState(),
        child: Container(
          color: themeBlue,
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
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
              children: [
                Headline(
                    data: '${Utils().capitalise(name)} Quiz', color: themeBlue),
                Expanded(
                  child: Text(
                      'You are about to take a quiz about ${Utils().capitalise(name)}. Click Start to get going or click Cancel to look at a different topic'),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, '/selection', (route) => false),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: state.nextPage,
                      child: const Text('Start'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
