import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/extracurricular/extracurricular_card.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class ExtracurricularScreen extends StatelessWidget {
  const ExtracurricularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getExtracurricular(),
        builder: (context, snapshot) {
          List<Resource> resources = snapshot.data!.resources;
          return Scaffold(
            appBar: const CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Headline(data: 'Extracurriculars', color: themeBlue),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: resources.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.transparent,
                        );
                      },
                      itemBuilder: (context, index) {
                        if (index != 0) {
                          return ExtracurricularCard(
                              resource: resources[index]);
                        } else {
                          return _IntroBox(resources: resources);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _IntroBox extends StatelessWidget {
  const _IntroBox({
    Key? key,
    required this.resources,
  }) : super(key: key);

  final List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: accentGreen,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            resources[0].name,
            style: TextStyle(
                color: themeGrey, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const VerticalDivider(),
          Expanded(
            child: FancyText(
              data: resources[0].description,
              color: themeGrey,
            ),
          ),
        ],
      ),
    );
  }
}
