import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/theme.dart';

import 'topic/topic_tile.dart';

class StudyTab extends StatefulWidget {
  final Study study;

  const StudyTab({super.key, required this.study});

  @override
  State<StudyTab> createState() => _StudyTabState();
}

class _StudyTabState extends State<StudyTab> {
  late final Study _study = widget.study;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeGrey,
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: _study.topics
            .map((topic) => TopicTile(
                  topic: topic,
                ))
            .toList(),
      ),
    );
  }
}
