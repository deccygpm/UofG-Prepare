import 'package:flutter/material.dart';
import 'package:l2_transition/profile/full_user_profile.dart';
import 'package:l2_transition/profile/guest_user_profile.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/shared/shared.dart';

class UserProfileWrapper extends StatelessWidget {
  const UserProfileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getCurrentUser(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("error");
          } else if (snapshot.hasData) {
            if (snapshot.data?.email == '') {
              return GuestUserProfileScreen(user: snapshot.data);
            } else {
              return UserWithFullProfileScreen(user: snapshot.data);
            }
          } else {
            return const Text('idk');
          }
        }));
  }
}
