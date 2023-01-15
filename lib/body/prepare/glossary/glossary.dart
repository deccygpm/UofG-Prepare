import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/shared/app_bar.dart';
import 'package:l2_transition/shared/loading.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: FutureBuilder(
          future: FirestoreService().getGlossary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else {
              var terms = snapshot.data!.terms;
              return ListView.builder(
                itemCount: terms.length,
                itemBuilder: (context, index) {
                  return Text(terms[index].term);
                },
              );
            }
          },
        ));
  }
}
