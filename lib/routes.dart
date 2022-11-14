import 'package:l2_transition/home/home.dart';
import 'package:l2_transition/login/login.dart';
import 'package:l2_transition/selection/selection.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => const LoginScreen(),
  '/selection': (context) => const SelectionScreen(),
};
