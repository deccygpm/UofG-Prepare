import 'package:flutter/material.dart';
import 'package:l2_transition/shared/app_bar.dart';

class AcademicResourcesScreen extends StatelessWidget {
  const AcademicResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text('academic resources'),
    );
  }
}
