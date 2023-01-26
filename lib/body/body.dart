import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/prepare/prepare_menu.dart';
import 'package:uofg_prepare/shared/app_bar.dart';
import 'package:uofg_prepare/body/study/study_menu.dart';
import 'package:uofg_prepare/theme.dart';

class SelectSectionScreen extends StatefulWidget {
  const SelectSectionScreen({super.key});

  @override
  State<SelectSectionScreen> createState() => _SelectSectionScreenState();
}

class _SelectSectionScreenState extends State<SelectSectionScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const PrepareMenuScreen(),
      const StudyMenuScreen(),
    ];

    return Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: themeBlue,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 14, color: themeGrey),
            ),
          ),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(
                    Icons.grid_4x4_rounded,
                    color: themeGrey,
                  ),
                  label: 'Prepare'),
              NavigationDestination(
                  icon: Icon(
                    Icons.quiz_rounded,
                    color: themeGrey,
                  ),
                  label: 'Study'),
            ],
          ),
        ),
        body: screens[index]);
  }
}
