import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/study/study_tab.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/loading.dart';
import 'package:uofg_prepare/theme.dart';

class StudyMenuScreen extends StatefulWidget {
  const StudyMenuScreen({super.key});

  @override
  State<StudyMenuScreen> createState() => _StudyMenuScreenState();
}

class _StudyMenuScreenState extends State<StudyMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getAllStudySections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else if (snapshot.hasData) {
            List<Study> studies = snapshot.data!;
            return DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Material(
                      color: themeBlue,
                      child: const TabBar(
                        labelStyle: TextStyle(height: 1.5),
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Tab(
                            text: 'Programming',
                          ),
                          Tab(
                            text: 'Python',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          StudyTab(study: studies[0]),
                          StudyTab(study: studies[1])
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Text('Database Issue');
          }
        });
  }
}
