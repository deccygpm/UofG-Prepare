import 'package:l2_transition/home/home.dart';
import 'package:l2_transition/profile/profile.dart';
import 'package:l2_transition/selection/selection.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/selection': (context) => const SelectionScreen(),
  '/profile': (context) => const UserProfilePage(),
};
