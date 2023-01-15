import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/academic_resources/academic_resources.dart';
import 'package:l2_transition/body/prepare/english_language/english_language.dart';
import 'package:l2_transition/body/prepare/extracurricular/extracurricular.dart';
import 'package:l2_transition/body/prepare/glossary/glossary.dart';
import 'package:l2_transition/body/prepare/socials/socials.dart';
import 'package:l2_transition/body/prepare/testimonials/testimonials.dart';
import 'package:l2_transition/body/prepare/timetable/timetable.dart';
import 'package:l2_transition/body/prepare/todo/todo.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/local_data.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
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
                                        Text(
                                          sections[index].name,
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: TextStyle(
                                              color: themeGrey, fontSize: 16),
                                        ),
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
