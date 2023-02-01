import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/study/topic/topic_content_body.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';
import 'package:url_launcher/url_launcher.dart';

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
            margin: const EdgeInsets.all(20),
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
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: accentGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      var uri = Uri.parse(topic.link);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      } else {
                        throw 'Could not launch $uri';
                      }
                    },
                    child: Text(
                      'Tutorials Point',
                      style: TextStyle(
                          color: themeGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Image.asset(topic.intro.image),
              ],
            ),
          ),
        ));
  }
}
