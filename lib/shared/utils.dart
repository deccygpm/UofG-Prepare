import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showErrorAlert(String? text) {
    if (text == null) return;
    final alert = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 169, 54, 56),
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(alert);
  }

  static showSuccessAlert(String? text) {
    if (text == null) return;
    final alert = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromARGB(255, 44, 163, 77),
      content: Row(children: [
        const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.white,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(alert);
  }
}
