import 'package:email_validator/email_validator.dart';

class ValidationService {
  final RegExp regex = RegExp(r'^(?=.*?[A-Z]).{8,}$');

  String? validateEmail(String email) {
    if (!EmailValidator.validate(email)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String? validatePassword(String password) {
    if (!(regex.hasMatch(password))) {
      return 'Password must be at least 8 characters.\nPassword must contain at least one uppercase letter.';
    } else {
      return null;
    }
  }
}
