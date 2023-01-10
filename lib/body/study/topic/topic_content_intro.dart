import 'package:flutter/material.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class TopicIntroScreen extends StatelessWidget {
  final Topic topic;
  const TopicIntroScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            Hero(
              tag: topic.name,
              child: Image.asset(
                topic.image,
                width: MediaQuery.of(context).size.width / 2,
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
            ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: themeBlue,
                    indent: 10,
                    endIndent: 10,
                  );
                },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: topic.content.length,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: FancyText(
                        data: topic.content[index],
                      ));
                }))
          ],
        ));
  }
}
