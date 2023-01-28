import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademicResourceCard extends StatelessWidget {
  final AcademicResource resource;
  const AcademicResourceCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: themeGrey, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            resource.title,
            style: TextStyle(
              color: themeBlue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    resource.description,
                    softWrap: true,
                    style: TextStyle(color: themeBlue, fontSize: 14),
                  ),
                ),
                VerticalDivider(
                  color: themeBlue,
                  thickness: 3,
                ),
                GestureDetector(
                  onTap: (() async {
                    var uri = Uri.parse(resource.link);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  }),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
