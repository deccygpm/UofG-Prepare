import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showErrorAlert(String? text) {
    if (text == null) return;
    final alert = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFF003865),
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(alert);
  }
}
