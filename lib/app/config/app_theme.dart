import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
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
