import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

/// Байнга ашиглагдах [styling] утгууд
class AppConstants {
  static const String appCopyright = '© 2022';

  /// [Widget] хооронд зай авахдаа дуудна.
  ///  [AppConstants.borderRadius] гэх мэт.
  /// spacing
  static const Widget hElementSpacing = SizedBox(width: 8.0);
  static const Widget vElementSpacing = SizedBox(height: 8.0);
  static const Widget hTitleSpacing = SizedBox(width: 16.0);
  static const Widget vTitleSpacing = SizedBox(height: 16.0);

  /// padding & margin
  static const EdgeInsets padding168 = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  );
  static const double elevition = 16.0;
  static BorderRadius borderRadius = BorderRadius.circular(10.0);

  //  todo: add more constants here
}
