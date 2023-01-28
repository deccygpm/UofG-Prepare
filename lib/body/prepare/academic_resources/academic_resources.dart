import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/shared/app_bar.dart';
import 'package:uofg_prepare/shared/shared.dart';

class AcademicResourcesScreen extends StatelessWidget {
  const AcademicResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getAcademicResources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return Scaffold(
              appBar: CustomAppBar(),
              body: Text(snapshot.data!.resources[0].title),
            );
          } else {
            return const Text('Database problem');
          }
        });
  }
}
