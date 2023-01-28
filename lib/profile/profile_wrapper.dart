import 'package:flutter/material.dart';
import 'package:uofg_prepare/profile/full_user_profile.dart';
import 'package:uofg_prepare/profile/guest_user_profile.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/shared/shared.dart';

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
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            if (snapshot.data?.email == '') {
              return GuestUserProfileScreen(user: snapshot.data);
            } else {
              return UserWithFullProfileScreen(user: snapshot.data);
            }
          } else {
            return const Text('Database Problem');
          }
        }));
  }
}
