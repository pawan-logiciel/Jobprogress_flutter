import 'package:flutter/material.dart';
import 'package:jp_ui/screens/home_screen.dart';
import 'package:jp_ui/screens/login_screen.dart';
import 'package:jp_ui/screens/task_listing.dart';
import 'package:jp_ui/size_config.dart';

import 'styling.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomeView());
    case 'login':
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case 'task_listing':
      return MaterialPageRoute(builder: (context) => TaskScreen());
  }
}

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
              title: 'JobProgress',
              onGenerateRoute: generateRoute,
              theme: AppTheme.lightTheme,
              initialRoute: '/'
            );
          },
        );
      },
    );
  }
}
