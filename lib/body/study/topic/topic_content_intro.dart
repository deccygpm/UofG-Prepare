import 'package:flutter/material.dart';
import 'package:l2_transition/body/study/topic/topic_content_body.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class TopicIntroScreen extends StatelessWidget {
  final Topic topic;
  const TopicIntroScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeBlue,
          onPressed: (() {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TopicContentScreen(
                content: topic.contents,
                quiz: topic.quiz,
                name: topic.name,
              ),
            ));
          }),
          child: const Text('Start'),
        ),
        appBar: const CustomAppBar(),
        body: ListView(
          children: [
            Hero(
              tag: topic.name,
              child: Image.asset(
                topic.image,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Center(
              child: Text(
                Utils().capitalise(topic.name),
                style: const TextStyle(
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: FancyText(data: topic.intro.content),
            ),
            Image.asset(topic.intro.image),
          ],
        ));
  }
}
