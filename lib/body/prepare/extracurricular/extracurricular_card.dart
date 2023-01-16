import 'package:flutter/material.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class ExtracurricularCard extends StatelessWidget {
  final Resource resource;
  const ExtracurricularCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: accentBlue),
      child: Expanded(
        child: Column(
          children: [
            Text(
              resource.name,
              style: TextStyle(
                  color: themeGrey, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            FancyText(
              data: resource.description,
              color: themeGrey,
            ),
            Image.asset('assets/image/misc/gla-facade.jpg'),
          ],
        ),
      ),
    );
  }
}
