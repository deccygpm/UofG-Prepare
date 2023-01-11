import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:l2_transition/body/study/quiz/quiz_state.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/app_bar.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  final Quiz quiz;
  final String name;
  const QuizScreen({super.key, required this.quiz, required this.name});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return ChangeNotifierProvider(
      create: (_) => QuizState(),
      child: Scaffold(
        appBar: AppBar(),
        body: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              if (index == 0) {
                //Welcome Page
              }
              if (index == (quiz.questions.length - 1)) {
                //Congrats Page
              } else {
                //Question Page
              }
            })),
      ),
    );
  }
}
