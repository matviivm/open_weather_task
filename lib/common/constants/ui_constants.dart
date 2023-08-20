import 'package:flutter/material.dart';

class UIConstants {
  // Durations

  static const splashScreenDuration = Duration(seconds: 2);

  // Text styles
  static const styleWhite36Bold = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const styleOrange30W500 = TextStyle(
    color: Colors.orange,
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );

  static const styleWhite28W500 = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );

  static const styleWhite22Bold = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const styleBlack14Bold = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // num values
  static const space4 = 4.0;
  static const space8 = 8.0;
  static const space12 = 12.0;
  static const space24 = 24.0;
  static const space40 = 40.0;
  static const space60 = 60.0;

  //border radius
  static const radius10 = BorderRadius.all(
    Radius.circular(10),
  );

  static const radius24 = BorderRadius.all(
    Radius.circular(24),
  );
}
