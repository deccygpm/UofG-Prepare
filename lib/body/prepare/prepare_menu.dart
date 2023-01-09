import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/local_data.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/loading.dart';

class PrepareMenuScreen extends StatefulWidget {
  const PrepareMenuScreen({super.key});

  @override
  State<PrepareMenuScreen> createState() => _PrepareMenuScreenState();
}

class _PrepareMenuScreenState extends State<PrepareMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LocalData().getSchool(),
        builder: (context, school) {
          if (school.hasData) {
            return FutureBuilder(
              future: FirestoreService().getSchool('socs'),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  School? sch = snapshot.data!;
                  List<Section> sections = sch.sections;

                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: sections.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            print('I work');
                          },
                          child: Card(
                            color: Colors.amber,
                            child: Center(child: Text(sections[index].name)),
                          ),
                        );
                      });
                } else {
                  return const LoadingScreen();
                }
              }),
            );
          } else {
            return const LoadingScreen();
          }
        });
  }
}
