import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/prepare/academic_resources/academic_resources.dart';
import 'package:uofg_prepare/body/prepare/english_language/english_language.dart';
import 'package:uofg_prepare/body/prepare/extracurricular/extracurricular.dart';
import 'package:uofg_prepare/body/prepare/glossary/glossary.dart';
import 'package:uofg_prepare/body/prepare/socials/socials.dart';
import 'package:uofg_prepare/body/prepare/testimonials/testimonials.dart';
import 'package:uofg_prepare/body/prepare/timetable/timetable.dart';
import 'package:uofg_prepare/body/prepare/todo/todo.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/services/local_data.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

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

                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Headline(data: 'Prepare', color: themeBlue),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: sections.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    selection(sections[index].name);
                                  },
                                  child: Card(
                                    color: accentBlue,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          sections[index].icon,
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(sections[index].name,
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                            style: Platform.isIOS
                                                ? TextStyle(
                                                    color: themeGrey,
                                                    fontSize: 16)
                                                : TextStyle(
                                                    color: themeGrey,
                                                    fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  );
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

  void selection(String name) {
    switch (name) {
      case 'ToDo':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ToDoScreen(),
        ));
        break;
      case 'Glossary':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const GlossaryScreen(),
        ));
        break;
      case 'Testimonials':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const TestimonialsScreen(),
        ));
        break;
      case 'Academic Resources':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const AcademicResourcesScreen(),
        ));
        break;
      case 'English Language':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const EnglishLanguageScreen(),
        ));
        break;
      case 'Socials':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const SocialsScreen(),
        ));
        break;
      case 'Example Timetable':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const TimetableScreen(),
        ));
        break;
      case 'Extracurricular':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ExtracurricularScreen(),
        ));
        break;

      default:
        Utils.showSuccessAlert('I work');
    }
  }
}
