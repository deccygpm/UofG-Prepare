import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/prepare/timetable/timetable_card.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';
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
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
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
