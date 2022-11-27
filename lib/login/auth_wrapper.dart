import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:l2_transition/login/login.dart';
import 'package:l2_transition/login/registration.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : RegistrationScreen(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
