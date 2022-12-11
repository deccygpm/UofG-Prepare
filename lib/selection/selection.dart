import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/shared/shared.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getSchools(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("error");
          } else if (snapshot.hasData) {
            var schools = snapshot.data!;
            return const Scaffold(
              appBar: CustomAppBar(),
              body: Text("hi"),
            );
          } else {
            return const Text('idfk');
          }
        }));
  }
}
