import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
    canvasColor: const Color.fromARGB(255, 205, 205, 205),
    fontFamily: GoogleFonts.bitter().fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        )),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ));
