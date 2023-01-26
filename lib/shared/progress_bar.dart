import 'package:flutter/material.dart';
import 'package:uofg_prepare/theme.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double height;
  const ProgressBar({super.key, this.height = 12, required this.value});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((BuildContext context, BoxConstraints box) {
      return Container(
        padding: const EdgeInsets.all(10),
        width: box.maxWidth,
        child: Stack(children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: themeBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(height),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            height: height,
            width: box.maxWidth * _floor(value),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(
                Radius.circular(height),
              ),
            ),
          )
        ]),
      );
    }));
  }

  _floor(double value, [min = 0.0]) {
    return value.sign <= min ? min : value;
  }
}
