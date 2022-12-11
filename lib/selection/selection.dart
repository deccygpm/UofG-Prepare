import 'package:flutter/material.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';

class SelectionScreen extends StatelessWidget {
  SelectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getSchools(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading");
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("error");
          } else if (snapshot.hasData) {
            var schools = snapshot.data!;
            return Scaffold(
              appBar: CustomAppBar(),
              body: Text("hi"),
            );
          } else {
            return Text('idfk');
          }
        }));
  }
}
