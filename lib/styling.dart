import 'package:flutter/material.dart';
import 'package:jp_ui/size_config.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFFFF7EC);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: lightTextTheme,
    fontFamily: 'Roboto'
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    bodyText1: _baseTextLight,
    headline1: _headingTextLight,
    headline6: _baseLinkLight,
  );

  static final TextTheme darkTextTheme = TextTheme(
    bodyText1: _baseTextDark
  );

  static final TextStyle _baseTextLight = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  static final TextStyle _headingTextLight = TextStyle(
    fontSize: SizeConfig.isIpad  ? 26 : 24,
    color: Colors.black87,
    fontWeight: FontWeight.w400
  );

  static final TextStyle _baseLinkLight = TextStyle(
    color: Color.fromRGBO(53, 126, 189, 1),
    fontSize: 14,
    fontWeight: FontWeight.w400
  );

  static final TextStyle _baseTextDark = _baseTextLight.copyWith(color: Colors.white);
}
