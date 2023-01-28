import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/prepare/academic_resources/academic_resource_card.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class AcademicResourcesScreen extends StatefulWidget {
  const AcademicResourcesScreen({super.key});

  @override
  State<AcademicResourcesScreen> createState() =>
      _AcademicResourcesScreenState();
}

class _AcademicResourcesScreenState extends State<AcademicResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getAcademicResources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            List<AcademicResource> resources = snapshot.data!.resources;
            List<String> categories =
                resources.map((resource) => resource.category).toSet().toList();

            return Scaffold(
              appBar: const CustomAppBar(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Headline(data: 'Academic Resources', color: themeBlue),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ExpansionTile(
                                childrenPadding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                textColor: themeGrey,
                                iconColor: themeGrey,
                                collapsedIconColor: themeGrey,
                                collapsedBackgroundColor: accentBlue,
                                backgroundColor: accentBlue,
                                title: Text(
                                  categories[index],
                                  style:
                                      TextStyle(color: themeGrey, fontSize: 24),
                                ),
                                children: [
                                  ListView.builder(
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: resources
                                          .where((element) =>
                                              element.category ==
                                              categories[index])
                                          .toList()
                                          .length,
                                      itemBuilder: ((context, i) {
                                        List<AcademicResource>
                                            filteredResources = resources
                                                .where((element) =>
                                                    element.category ==
                                                    categories[index])
                                                .toList();
                                        return AcademicResourceCard(
                                            resource: filteredResources[i]);
                                      }))
                                ],
                              ),
                            ),
                          );
                        })),
                  )
                  //resources
                ],
              ),
            );
          } else {
            return const Text('Database problem');
          }
        });
  }
}
