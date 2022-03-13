// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        canvasColor: creamColor,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: darkBluishColor, primary: Colors.black),
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black)),
      );
  static ThemeData get darkTheme => ThemeData(
        // brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.white, primary: Colors.white),
        canvasColor: darkcreamColor,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white)),
      );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Color(0xff212121);
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Color(0xffba68c8);
}
