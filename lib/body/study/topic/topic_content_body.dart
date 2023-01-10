import 'package:flutter/material.dart';
import 'package:l2_transition/body/study/topic/topic_quiz.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class TopicContentScreen extends StatefulWidget {
  final List<String> content;
  final Quiz quiz;

  const TopicContentScreen({
    super.key,
    required this.content,
    required this.quiz,
  });

  @override
  State<TopicContentScreen> createState() => _TopicContentScreenState();
}

class _TopicContentScreenState extends State<TopicContentScreen> {
  late final List<String> _content = widget.content;
  late final Quiz _quiz = widget.quiz;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return PageView.builder(
        itemCount: _content.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              FancyText(data: _content[index]),
            ],
          );
        }));
  }
}
