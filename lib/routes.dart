import 'package:l2_transition/home/home.dart';
import 'package:l2_transition/login/login.dart';
import 'package:l2_transition/profile/profile.dart';
import 'package:l2_transition/selection/selection.dart';
import 'package:l2_transition/login/email_login.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => LoginScreen(),
  '/login/email': (context)  => const EmailLoginScreen(),
  '/selection': (context) => SelectionScreen(),
  '/profile': (context) => const UserProfilePage(),
};
