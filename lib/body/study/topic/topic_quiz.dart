import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/app_bar.dart';

class TopicQuizScreen extends StatefulWidget {
  final Quiz quiz;
  const TopicQuizScreen({super.key, required this.quiz});

  @override
  State<TopicQuizScreen> createState() => _TopicQuizScreenState();
}

class _TopicQuizScreenState extends State<TopicQuizScreen> {
  late final Quiz _quiz = widget.quiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text(_quiz.questions[0].question),
    );
  }
}
