import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({Key? key, required this.data, required this.color})
      : super(key: key);

  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          data,
          style: TextStyle(
            fontSize: 30,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.black,
          ),
        ),
        Text(
          data,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: color,
          ),
        ),
      ],
    );
  }
}
