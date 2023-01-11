import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/local_data.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';

class SelectSchoolScreen extends StatelessWidget {
  const SelectSchoolScreen({
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
            return Center(
              child: Utils.showErrorAlert(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<School>? schools = snapshot.data;

            return Scaffold(
              appBar: const CustomAppBar(),
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(schools[index].fullName),
                      onTap: () {
                        LocalData().setSchool(schools[index].id);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/selection', (route) => false);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: schools!.length),
            );
          } else {
            return const Text('Database Problem');
          }
        }));
  }
}
