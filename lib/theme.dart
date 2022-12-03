import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color themeGrey = Color.fromARGB(255, 236, 231, 231);
Color themeBlue = Color(0xFF003865);

var appTheme = ThemeData(
    canvasColor: themeGrey,
    fontFamily: GoogleFonts.lusitana().fontFamily,
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
