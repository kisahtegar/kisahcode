import 'package:flutter/material.dart';

/// Using for Color App
class ColorConst {
  static const bgColor = Color.fromARGB(255, 40, 30, 40);
  static const bodyTitleTextColor = Color.fromARGB(255, 255, 255, 255);
  static const bodyTextColor = Color(0xFF8B8B8D);
  static const primaryColor = Color.fromARGB(255, 226, 7, 255);
  static const secondaryColor = Color.fromARGB(255, 48, 36, 45);
  // static const secondaryColor = Color(0xFF242430);
  static const darkColor = Color.fromARGB(255, 35, 25, 34);
}

/// Using for Padding App
class PaddingConst {
  static const defaultPadding = 20.0;
}

/// Using for make size or space between widget or other.
class SizeConst {
  /// Create vertical `SizedBox()`
  static Widget sizeVer(double height) {
    return SizedBox(height: height);
  }

  /// Create horizontal `SizedBox()`
  static Widget sizeHor(double width) {
    return SizedBox(width: width);
  }
}

const defaultDuration = Duration(seconds: 1);
const maxWidth = 1440.0;

final myTimeLine = [
  '[September 2021]\nUniversity Insan Pembangunan',
  'What\'s Next?...',
];
