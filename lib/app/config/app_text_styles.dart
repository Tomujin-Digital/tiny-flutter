import 'package:flutter/material.dart';

import 'app_constants.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24.0,
    color: C.colorDarkBlue,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle blueSubTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFF0F2851),
  );
  static const TextStyle greySubTitle = TextStyle(
    fontSize: 14.0,
    color: C.colorGrey1,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle smallGrey = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF717171),
  );
  static const TextStyle body = TextStyle(
    fontSize: 13,
    color: C.colorGrey1,
  );
  static const TextStyle smallPrimary = TextStyle(
    fontSize: 13,
    color: Colors.purple,
  );
  // implement additional TextStyles here
}
