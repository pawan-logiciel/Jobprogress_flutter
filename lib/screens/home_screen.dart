import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right:30, top: 40, bottom: 10),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset('images/jp-logo.png', width: 90),
                SizedBox(
                  height: 20,
                ),
                Text('Welcome to JobProgress', style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w400
                ),)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(238, 238, 238, 1), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(238, 238, 238, 1), width: 1.0),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(84, 98, 125, 1)
                      ),
                      hintText: 'Johndoe@gmail.com'
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(238, 238, 238, 1), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(238, 238, 238, 1), width: 1.0),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(84, 98, 125, 1)
                      ),
                      hintText: '*******',
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot password?', style: TextStyle(
                      color: Color.fromRGBO(53, 126, 189, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    )
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(53, 126, 189, 1),
              ),
              child: TextButton(
                onPressed: () {
                  // To do
                },
                child: Text("LOGIN", style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  Text('SIGNUP', style: TextStyle(
                      color: Color.fromRGBO(53, 126, 189, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text('TRY QUICK DEMO', style: TextStyle(
                      color: Color.fromRGBO(53, 126, 189, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
              )),
            )
          ],
        )
      ),
    );
  }
}