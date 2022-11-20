import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({Key? key, required this.label, required this.isObscure, required this.keyboard}) : super(key: key);

  final String label;
  final bool isObscure;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 3.0,
              )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: TextField(
                obscureText: isObscure,
                keyboardType: keyboard,
                decoration: InputDecoration(
                  labelText: label,
                )),
          )),
    );
  }
}
