import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/app_bar.dart';

class TopicContentScreen extends StatelessWidget {
  final Topic topic;
  const TopicContentScreen({super.key, required this.topic});

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
            Text(
              topic.name,
              style: TextStyle(
                height: 2,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ));
  }
}
