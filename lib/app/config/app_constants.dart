import 'package:flutter/material.dart';

/// Байнга ашиглагдах [styling] утгууд
class C {
  static const String appCopyright = '© 2022';
  static const Color colorDarkBlue = Color(0xFF0F2851);
  static const Color primaryColorPink = Color(0xFFEF518B);
  static const Color colorGrey1 = Color(0xFF666666);
  static const Color colorGrey2 = Color(0xFFf3f3f3);

  ///  [C.borderRadius] гэх мэт.
  /// spacing
  static const Widget hElementSpacing = SizedBox(width: 8.0);
  static const Widget vElementSpacing = SizedBox(height: 8.0);
  static const Widget hTitleSpacing = SizedBox(width: 16.0);
  static const Widget vTitleSpacing = SizedBox(height: 16.0);

  /// padding & margin
  static const EdgeInsets padding168 =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  static const EdgeInsets padding16 = EdgeInsets.all(16.0);
  static const EdgeInsets padding40 = EdgeInsets.symmetric(horizontal: 4.0);
  static const double elevation = 16.0;
  static BorderRadius borderRadius = BorderRadius.circular(12.0);

  //  todo: add more constants here
}
