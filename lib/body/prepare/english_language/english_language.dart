import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/english_language/english_language_card.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class EnglishLanguageScreen extends StatelessWidget {
  const EnglishLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: FirestoreService().getEnglishLanguage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            return Column(
              children: [
                Headline(data: 'Langauge Resources', color: themeBlue),
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.resources.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: EnglishLanguageCard(
                            resource: snapshot.data!.resources[index],
                          ),
                        );
                      }),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
