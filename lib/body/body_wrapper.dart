import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/select_school.dart';
import 'package:uofg_prepare/body/body.dart';
import 'package:uofg_prepare/services/local_data.dart';

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
            return const SelectSectionScreen();
          } else {
            return const SelectSchoolScreen();
          }
        }));
  }
}
