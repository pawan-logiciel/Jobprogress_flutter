import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;

  static bool isPortrait = true;
  static bool isMobilePortrait = false;
  static bool isIpad = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    print(orientation);
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
    print(screenHeight);

    if((orientation == Orientation.portrait && screenWidth >= 768) || (orientation != Orientation.portrait && screenHeight >= 768)) isIpad = true;

    print("isIpad $isIpad");
    print("isPortrait $isPortrait");
    print("isMobilePortrait $isMobilePortrait");
  }
}