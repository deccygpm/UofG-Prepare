import 'package:flutter/material.dart';
import 'package:l2_transition/body/study/quiz/quiz_complete.dart';
import 'package:l2_transition/body/study/quiz/quiz_intro.dart';
import 'package:l2_transition/body/study/quiz/quiz_question.dart';
import 'package:l2_transition/body/study/quiz/quiz_state.dart';
import 'package:l2_transition/services/models.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  final Quiz quiz;
  final String name;
  const QuizScreen({super.key, required this.quiz, required this.name});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => QuizState(),
        builder: ((context, child) {
          var state = Provider.of<QuizState>(context);
          return Scaffold(
            appBar: AppBar(),
            body: PageView.builder(
                controller: state.controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  state.progress = (index / (quiz.questions.length + 1));
                },
                itemBuilder: ((context, index) {
                  if (index == 0) {
                    return QuizIntroScreen(name: name);
                  }
                  if (index == (quiz.questions.length + 1)) {
                    return QuizCompleteScreen(name: name, quiz: quiz);
                  } else {
                    return QuizQuestionScreen(
                        question: quiz.questions[index - 1]);
                  }
                })),
          );
        }));
  }
}
