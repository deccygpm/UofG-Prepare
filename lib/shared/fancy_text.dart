import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FancyText extends StatelessWidget {
  final String data;
  final Color color;
  const FancyText({super.key, required this.data, required this.color});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data.toString(),
      style: {
        "p": Style(
            fontWeight: FontWeight.normal,
            fontSize: FontSize.large,
            color: color),
        "b": Style(fontWeight: FontWeight.bold, color: color),
        "i": Style(fontStyle: FontStyle.italic, color: color),
      },
    );
  }
}
