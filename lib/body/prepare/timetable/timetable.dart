import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/timetable/timetable_card.dart';
import 'package:l2_transition/shared/app_bar.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Headline(data: 'Example Timetable', color: themeBlue),
          TimeTableCard(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 500,
                child: Image.asset(
                  'assets/image/misc/timetable.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
