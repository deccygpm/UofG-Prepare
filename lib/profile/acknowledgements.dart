import 'package:flutter/material.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AcknowledgementsScreen extends StatelessWidget {
  const AcknowledgementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBlue,
      appBar: const CustomAppBar(),
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        Headline(
          data: 'Acknowledgements',
          color: themeGrey,
        ),
        Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: themeGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Created by Declan McBride',
                  style: TextStyle(color: themeBlue),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Text(
                  'With thanks to:',
                  style: TextStyle(color: themeBlue),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Dr. Mireilla Bikanga Ada, for your guidance and support throughout.',
                    style: TextStyle(color: themeBlue),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var uri = Uri.parse('https://fireship.io');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  child: Text(
                    'fireship.io, without which this app simply wouldn\'t exist',
                    style: TextStyle(
                        color: themeBlue, decoration: TextDecoration.underline),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var uri = Uri.parse('https://www.youtube.com/@HeyFlutter');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  child: Text(
                    'Johannes Mike, for invaluable tutorials',
                    style: TextStyle(
                        color: themeBlue, decoration: TextDecoration.underline),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var uri =
                        Uri.parse('https://www.youtube.com/@createdbykoko');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  child: Text(
                    'Mitch Koko, for amazing tutorials.',
                    style: TextStyle(
                        color: themeBlue, decoration: TextDecoration.underline),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var uri = Uri.parse(
                        'https://unsplash.com/@paulina_2b?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  child: Text(
                    'Photos by Paulina B.',
                    style: TextStyle(
                        color: themeBlue, decoration: TextDecoration.underline),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var uri = Uri.parse(
                        'https://unsplash.com/ja/@rosssneddon?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  child: Text(
                    'Photos by Ross Sneddon',
                    style: TextStyle(
                        color: themeBlue, decoration: TextDecoration.underline),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var uri = Uri.parse('https://www.drawkit.com');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  child: Text(
                    'Illustrations by Drawkit',
                    style: TextStyle(
                        color: themeBlue, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
