import 'package:flutter/material.dart';

import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class EnglishLanguageCard extends StatelessWidget {
  final EnglishResource resource;
  const EnglishLanguageCard({
    super.key,
    required this.resource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: accentBlue),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              resource.name,
              style: TextStyle(fontSize: 24, color: themeGrey),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FancyText(data: resource.description, color: themeGrey),
              ),
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  resource.image,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
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
