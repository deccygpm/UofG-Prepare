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
          child: Text('Start'),
          onPressed: (() {
            showDialog(
              context: context,
              builder: (BuildContext context) => LayoutBuilder(
                builder: (context, constraints) {
                  return AlertDialog(
                    elevation: 10,
                    backgroundColor: themeGrey,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * .5,
                          width: constraints.maxWidth,
                          child: TopicContentScreen(
                            content: topic.content,
                            quiz: topic.quiz,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        ),
        appBar: CustomAppBar(),
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
                style: TextStyle(
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
