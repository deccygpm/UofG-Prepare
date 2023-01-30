import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/prepare/testimonials/testimonial_card.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

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
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return TestimonialCard(
                              testimony: testimonials[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.transparent,
                          );
                        },
                        itemCount: testimonials.length),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
