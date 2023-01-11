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
        backgroundColor: themeGrey,
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
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 3,
                ),
              ],
              color: accentBlue,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView(
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
                      color: themeGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: FancyText(
                    data: topic.intro.content,
                    color: themeGrey,
                  ),
                ),
                Image.asset(topic.intro.image),
              ],
            ),
          ),
        ));
  }
}
