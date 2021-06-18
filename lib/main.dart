import 'package:flutter/material.dart';
import 'package:jp_ui/screens/home_screen.dart';
import 'package:jp_ui/size_config.dart';

import 'styling.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Learning Platform Application',
              theme: AppTheme.lightTheme,
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
