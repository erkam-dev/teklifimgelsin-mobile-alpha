import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData tgLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.blue.shade900,
    ),
    textTheme: TextTheme(
      subtitle1: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: const Color.fromARGB(255, 59, 180, 172),
      ),
      bodyText1: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: const Color.fromARGB(255, 59, 180, 172),
      ),
      bodyText2: GoogleFonts.quicksand(
        fontSize: 20,
      ),
      headline1: GoogleFonts.quicksand(),
      headline2: GoogleFonts.quicksand(),
      headline3: GoogleFonts.quicksand(
        fontSize: 32,
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      headline5: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        color: Colors.orange.shade900,
      ),
      headline6: GoogleFonts.quicksand(
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      subtitle2: GoogleFonts.quicksand(),
      button: GoogleFonts.quicksand(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.grey.shade100,
      foregroundColor: Colors.black,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.grey.withAlpha(50),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 59, 180, 172),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}

ThemeData tgDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme:
        const ColorScheme.dark().copyWith(primary: Colors.blue.shade300),
    textTheme: TextTheme(
      subtitle1: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: const Color.fromARGB(255, 59, 180, 172),
      ),
      bodyText1: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: const Color.fromARGB(255, 59, 180, 172),
      ),
      bodyText2: GoogleFonts.quicksand(
        fontSize: 20,
      ),
      headline1: GoogleFonts.quicksand(),
      headline2: GoogleFonts.quicksand(),
      headline3: GoogleFonts.quicksand(
        fontSize: 32,
        color: Colors.blue.shade300,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      headline5: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        color: Colors.orange.shade900,
      ),
      headline6: GoogleFonts.quicksand(
        color: Colors.blue.shade300,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      button: GoogleFonts.quicksand(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.grey.shade900,
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.grey.withAlpha(50),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 5, 117, 110),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}
