import 'package:flutter/material.dart';
import 'package:l2_transition/body/study/topic_content.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/utils.dart';
import 'package:l2_transition/theme.dart';

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
                      TopicContentScreen(topic: topic),
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
