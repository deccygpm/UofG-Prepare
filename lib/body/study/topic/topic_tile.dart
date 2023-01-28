import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/study/topic/topic_content_intro.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/utils.dart';
import 'package:uofg_prepare/theme.dart';

class TopicTile extends StatelessWidget {
  final Topic topic;
  const TopicTile({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: topic.name,
        child: Card(
          color: accentBlue,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TopicIntroScreen(topic: topic),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    child: Image.asset(
                      topic.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        Utils().capitalise(topic.name),
                        style: TextStyle(
                          color: themeGrey,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
