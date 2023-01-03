import 'package:flutter/material.dart';
import 'package:l2_transition/selection/select_school.dart';
import 'package:l2_transition/selection/select_section.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/local_data.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';

class SelectionWrapper extends StatelessWidget {
  const SelectionWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LocalData().isSchoolSet(),
        builder: ((context, snapshot) {
          if (snapshot.data == true) {
            return SelectSectionScreen();
          } else {
            return SelectSchoolScreen();
          }
        }));
  }
}
