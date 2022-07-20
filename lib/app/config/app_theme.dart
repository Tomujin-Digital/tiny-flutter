import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_colors.dart';
import '../modules/battle/utilities/colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: kPink,
          elevation: 0.0,
        ),

        colorScheme: const ColorScheme.light().copyWith(
          primary: kPink,
          secondary: kPink,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
        ),

        textTheme: ThemeData.light()
            .textTheme
            .copyWith(
              subtitle1: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: secondary,
              ),
            )
            .apply(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          linearMinHeight: 16.0,
          color: green,
          refreshBackgroundColor: Colors.white,
          linearTrackColor: Color(0xFFF2F2F2),
        ),
        // useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
          fillColor: Colors.white,
          iconColor: Colors.grey,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink),
          ),
        ),
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
