import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headline extends StatelessWidget {
  const Headline({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
        ),

      ),
    );
  }
}
