import 'package:flutter/material.dart';

class AppSizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getScreenHeight(double inputHeight) {
  return (inputHeight / 812.0) * AppSizeConfig.screenHeight;
}

double getScreenWidth(double inputWidth) {
  return (inputWidth / 375.0) * AppSizeConfig.screenWidth;
}
