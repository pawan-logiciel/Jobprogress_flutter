import 'dart:io';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:  Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // new Image.network('https://cdn.jobprogress.com/resources%2Flogiciel_solutions_-_test_1440047554%2Fjobs%2F2104-2163949-01%2Ffolder+6%2F1617874837606ecf95bcd05_cdv_photo_003_pv768.jpg', headers: headersMap),
                  SizedBox(height: 10),
                  Material(
                    color: Colors.red,
                    child: MaterialButton(
                      onPressed: (){
                        print('Button Preessed');
                        Navigator.pushNamed(context, 'login');
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Material(
                    color: Colors.red,
                    child: MaterialButton(
                      onPressed: (){
                        print('Button Preessed');
                        Navigator.pushNamed(context, 'task_listing');
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Task listing',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
        )),
    );
  }
}