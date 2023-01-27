import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: accentGreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      style: TextStyle(
                          color: themeGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      contact.title,
                      style: TextStyle(
                        color: themeGrey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  '✍️',
                  style: TextStyle(fontSize: 50),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              contact.detail,
              style: TextStyle(
                fontSize: 16,
                color: themeGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: OutlinedButton(
              onPressed: () async {
                var uri = Uri.parse(contact.link);
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
          ),
        ],
      ),
    );
  }
}
