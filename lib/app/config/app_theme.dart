import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearMinHeight: 16.0,
      color: Colors.green,
      refreshBackgroundColor: Colors.white,
      linearTrackColor: Color(0xFFF2F2F2),
    ),
    // useMaterial3: true,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        )),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.pink),
    )),
    // textTheme: const TextTheme().copyWith(
    //   bodyText1: const TextStyle(
    //       fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
    //   headline6: const TextStyle(
    //       fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    // ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
      ),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      // todo
    ),
  );
}
