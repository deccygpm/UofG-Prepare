import 'package:l2_transition/home/home.dart';
import 'package:l2_transition/login/login.dart';
import 'package:l2_transition/login/registration.dart';
import 'package:l2_transition/profile/profile.dart';
import 'package:l2_transition/selection/selection.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => const LoginScreen(),
  '/login/register': (context) => const RegistrationScreen(),
  '/selection': (context) => SelectionScreen(),
  '/profile': (context) => const UserProfilePage(),
};
