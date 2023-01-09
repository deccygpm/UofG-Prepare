import 'package:flutter/material.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/utils.dart';

class TopicTile extends StatelessWidget {
  final Topic topic;
  const TopicTile({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: topic.name,
        child: Column(
          children: [
            Image.asset(
              topic.image,
              height: 100,
              width: 75,
            ),
            Text(Utils().capitalise(topic.name)),
          ],
        ));
  }
}
