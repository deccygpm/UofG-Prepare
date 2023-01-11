import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color themeGrey = const Color.fromARGB(255, 251, 249, 249);
Color themeBlue = const Color(0xFF003865);
Color accentBlue = const Color.fromARGB(255, 68, 102, 152);
Color accentGreen = const Color(0xFF00B894);
Color altBlue = const Color(0xFF00638D);
Color accentYellow = const Color(0xFFF9F871);

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
