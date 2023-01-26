import 'package:flutter/material.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class TimeTableCard extends StatelessWidget {
  const TimeTableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: accentGreen,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Why?',
              style: TextStyle(
                  color: themeGrey, fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Expanded(
            child: FancyText(
              data:
                  '<p>Time management is a critical skill.\nBelow is an example of my own Second Year timetable looked like on a typical week.\nYou can see I have also blocked out time for personal study.\nIt is commong for Second Year Glasgow University computer science students to be shocked at the amount of time they need to invest to keep up with their classes.\nGive this timetable a look and make sure you\'re not one of them! 😄</p>',
              color: themeGrey,
            ),
          ),
        ],
      ),
    );
  }
}
