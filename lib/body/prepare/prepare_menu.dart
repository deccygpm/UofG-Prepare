import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/todo/todo.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/local_data.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/loading.dart';
import 'package:l2_transition/shared/utils.dart';
import 'package:l2_transition/theme.dart';

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
                            switch (sections[index].name) {
                              case 'to-do':
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ToDoScreen(),
                                ));
                                break;
                              default:
                                Utils.showSuccessAlert('I work');
                            }
                          },
                          child: Card(
                            color: accentBlue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  sections[index].icon,
                                  style: const TextStyle(fontSize: 40),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  sections[index].name,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style:
                                      TextStyle(color: themeGrey, fontSize: 16),
                                ),
                              ],
                            ),
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
