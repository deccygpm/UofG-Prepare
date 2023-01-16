import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/testimonials/testimonial_card.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';

class TestimonialsScreen extends StatelessWidget {
  const TestimonialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService().getTestimonials(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else {
          List<Testimony> testimonials = snapshot.data!.testimony;
          return Scaffold(
            appBar: const CustomAppBar(),
            body: Column(
              children: [
                Headline(data: 'Testimonials', color: themeBlue),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child:
                              TestimonialCard(testimony: testimonials[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.transparent,
                        );
                      },
                      itemCount: testimonials.length),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
