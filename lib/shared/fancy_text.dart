import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FancyText extends StatelessWidget {
  final String data;
  const FancyText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data.toString(),
      style: {
        "p": Style(fontWeight: FontWeight.normal, fontSize: FontSize.large),
        "b": Style(fontWeight: FontWeight.bold),
        "i": Style(fontStyle: FontStyle.italic),
      },
    );
  }
}
