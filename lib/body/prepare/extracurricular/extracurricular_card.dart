import 'package:flutter/material.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ExtracurricularCard extends StatelessWidget {
  final Resource resource;
  const ExtracurricularCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: accentBlue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              resource.name,
              style: TextStyle(
                  color: themeGrey, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          FancyText(
            data: resource.description,
            color: themeGrey,
          ),
          Image.asset(resource.image),
          OutlinedButton(
            onPressed: () async {
              var uri = Uri.parse(resource.link);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'Could not launch $uri';
              }
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: themeGrey,
              side: const BorderSide(color: Colors.black, width: 3),
            ),
            child: const Text(
              "Go",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
