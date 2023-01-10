import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopicContentScreen extends StatefulWidget {
  final List<String> content;

  const TopicContentScreen({super.key, required this.content});

  @override
  State<TopicContentScreen> createState() => _TopicContentScreenState();
}

class _TopicContentScreenState extends State<TopicContentScreen> {
  late List<String> _content = widget.content;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
