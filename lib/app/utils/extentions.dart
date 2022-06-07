import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension Captilize on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String convertDateTime(DateTime dateTime) {
    return "${dateTime.year}/${dateTime.month}/${dateTime.day}";
  }
}

extension Converter on double {
  double celsiusToFahrenheit() {
    return this * 1.8 + 32;
  }

  double fahrenheitToCelsius() {
    return (this - 32) / 1.8;
  }

  double kgToLbs() {
    return this * 2.20462262;
  }

  double lbsToKg() {
    return this / 2.20462262;
  }

  cmToInch() {
    return this / 2.54;
  }

  inchToCm() {
    return this * 2.54;
  }
}
