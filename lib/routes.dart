import 'package:uofg_prepare/body/body_wrapper.dart';
import 'package:uofg_prepare/home/home.dart';
import 'package:uofg_prepare/login/auth_wrapper.dart';
import 'package:uofg_prepare/profile/profile_wrapper.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/selection': (context) => const SelectionWrapper(),
  '/auth': (context) => const AuthScreen(),
  '/profile': (context) => const UserProfileWrapper(),
};
