import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:l2_transition/body/prepare/glossary/glossary_tile.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class GlossaryScreen extends StatefulWidget {
  const GlossaryScreen({super.key});

  @override
  State<GlossaryScreen> createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: FutureBuilder(
          future: FirestoreService().getGlossary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else {
              var terms = snapshot.data!.terms;
              return Column(
                children: [
                  Headline(data: 'Glossary', color: themeBlue),
                  Expanded(
                    child: GroupedListView(
                      groupSeparatorBuilder: (value) {
                        return Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 24,
                                color: themeBlue,
                              ),
                            ));
                      },
                      groupBy: (element) => element.term[0],
                      elements: terms,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          child: GlossaryTile(
                            term: index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
