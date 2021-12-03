import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookShelfTheme {
  static const Color ink01 = Color(0xFF191d21);
  static const Color ink02 = Color(0xFF656f77);
  static const Color ink03 = Color(0xFFACB8C2);
  static const Color ink04 = Color(0xFFcdd9e3);
  static const Color blueDolphin = Color(0xFF80D0F1);
  static const Color accentPalePurple = Color(0xFFF2E5FF);
  static const Color accentMistyRose = Color(0xFFFFE5E5);
  static const Color accentLinen = Color(0xFFFFF2E5);
  static const Color accentNyanza = Color(0xFFE5FFE5);
  static const Color accentLightCyan = Color(0xFFE5FFFF);
  static const Color accentAliceBlue = Color(0xFFE5F2FF);
  static const Color accentLavender = Color(0xFFE5E5FF);
  static const Color accentSluggyPink = Color(0xFFFFE5FF);
  static const Color accentPiggyPink = Color(0xFFFFE5F2);

  // 1 NOTE: Declares a TextTheme called lightTextTheme, which uses the Google // font Open Sans and has a predefined font size and weight. Most importantly, the color of the text is black.
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: ink01,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: ink01,
    ),
    caption: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: ink01,
    ),
    headline1: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
      color: ink01,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: ink01,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: ink01,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: ink01,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: ink01,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      // appBarTheme: const AppBarTheme(
      //   foregroundColor: Colors.black,
      //   backgroundColor: Colors.white,
      // ),
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.black,
      // ),
      textTheme: lightTextTheme,
    );
  }
}
