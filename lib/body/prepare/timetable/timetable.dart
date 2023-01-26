import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/timetable/timetable_card.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';
import 'package:photo_view/photo_view.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Headline(data: 'Example Timetable', color: themeBlue),
          const TimeTableCard(),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "You will need to study more than you think!",
              style: TextStyle(
                color: themeGrey,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: PhotoView(
              imageProvider:
                  const AssetImage('assets/image/misc/timetable.png'),
              backgroundDecoration:
                  const BoxDecoration(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
