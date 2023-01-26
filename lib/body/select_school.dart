import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/services/local_data.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

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
              body: Container(
                color: themeBlue,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Headline(data: 'Select School', color: themeGrey),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 3,
                            ),
                          ],
                          color: themeGrey,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.all(20),
                        child: ListView.separated(
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
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: schools!.length),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Database Problem');
          }
        }));
  }
}
