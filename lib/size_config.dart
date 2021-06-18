import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;

  static bool isPortrait = true;
  static bool isMobilePortrait = false;
  static bool isIpad = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
    print(screenWidth);
    if(screenWidth >= 768) isIpad = true;

    print("isIpad $isIpad");
    print("isPortrait $isPortrait");
    print("isMobilePortrait $isMobilePortrait");
  }
}