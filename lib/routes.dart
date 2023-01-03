import 'package:l2_transition/home/home.dart';
import 'package:l2_transition/login/auth_wrapper.dart';
import 'package:l2_transition/profile/profile_wrapper.dart';
import 'package:l2_transition/selection/selection_wrapper.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/selection': (context) => const SelectionWrapper(),
  '/auth': (context) => const AuthScreen(),
  '/profile': (context) => const UserProfileWrapper(),
};
