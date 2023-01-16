import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/app_bar.dart';
import 'package:l2_transition/shared/shared.dart';

class TestimonialsScreen extends StatelessWidget {
  const TestimonialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: FutureBuilder(
          future: FirestoreService().getTestimonials(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingScreen();
            } else {
              List<Testimony> testimonials = snapshot.data!.testimony;
              print(testimonials[0].intro.name);
              return Text('hi');
            }
          },
        ));
  }
}
