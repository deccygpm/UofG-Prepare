import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color themeGrey = const Color.fromARGB(255, 251, 249, 249);
Color themeBlue = const Color(0xFF003865);

var appTheme = ThemeData(
    canvasColor: themeGrey,
    fontFamily: GoogleFonts.literata().fontFamily,
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