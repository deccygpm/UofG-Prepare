import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
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
            List<School>? schools = snapshot.data;

            return Scaffold(
              appBar: const CustomAppBar(),
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    return Text(schools[index].fullName);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: schools!.length),
            );
          } else {
            return const Text('idfk');
          }
        }));
  }
}
