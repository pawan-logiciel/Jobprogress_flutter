import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loadmore/loadmore.dart';

import '../size_config.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int get count => entries.length;
  // This widget is the root of your application.
  List<int> entries = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 1];

  void initState() {
    super.initState();
    // list.addAll(List.generate(30, (v) => v));
  }

  void load() {
    print("load");
    setState(() {
      entries.addAll(List.generate(15, (v) => v));
      print("data count = ${entries.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => {},
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print(_scaffoldKey.currentState);
                  _scaffoldKey.currentState.openEndDrawer();
                },
                child: Icon(Icons.menu),
              )),
        ],
        title: Text('Appointments'),
        backgroundColor: Colors.red[900],
        centerTitle: false,
      ),
      endDrawer: NavDrawer(),
      body: SafeArea(
        child: Container(
          child: Container(
            child: (Column(
              children: [
                Container(
                  height: 30.0,
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.red[900],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 2,
                            bottom: 2,
                          ),
                          margin: EdgeInsets.all(5.0),
                          child: Text(
                            "DATE FILTER",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: LoadMore(
                        isFinish: count >= 60,
                        onLoadMore: _loadMore,
                        whenEmptyLoad: false,
                        delegate: DefaultLoadMoreDelegate(),
                        textBuilder: DefaultLoadMoreTextBuilder.english,
                        child: entries.length > 0
                            ? ListView.separated(
                                itemCount: entries.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(height: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                child: Text(
                                              "Commercial-Type / APPLIANCES  /Job # 2020-225",
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.content_copy,
                                                color: Colors.green[400],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "Recurring - Every 2 Weeks on Wednesday, Thursday, Friday, 730 times"),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Qwe"),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "Friday, 07/09/2021 11:30 am"),
                                        ),
                                      ],
                                    ),
                                  );
                                })
                            : Center(child: Text('No items')),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    print("data count = ${entries.length}");
    await Future.delayed(Duration(seconds: 2, milliseconds: 100));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
    entries.clear();
    load();
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/cover.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

class LoginScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 600,
      padding: EdgeInsets.only(
          left: 30, right: 30, top: SizeConfig.isIpad ? 0 : 40, bottom: 10),
      child: (Column(
        children: [
          Column(
            children: [
              Image.asset('images/jp-logo.png', width: 90),
              SizedBox(
                height: 20,
              ),
              Text('Welcome to JobProgress', style: theme.textTheme.headline1)
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
                        borderSide: BorderSide(
                            color: Color.fromRGBO(238, 238, 238, 1),
                            width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(238, 238, 238, 1),
                            width: 1.0),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(84, 98, 125, 1),
                      ),
                      hintText: 'Johndoe@gmail.com'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(238, 238, 238, 1), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(238, 238, 238, 1), width: 1.0),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(84, 98, 125, 1),
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
                Text('Forgot password?', style: theme.textTheme.headline6)
              ],
            ),
          ),
          Container(
            height: 60,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromRGBO(53, 126, 189, 1),
            ),
            child: TextButton(
              onPressed: () {
                // To do
              },
              child: Text("LOGIN",
                  style:
                      theme.textTheme.bodyText1.copyWith(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? '),
                Text('SIGNUP', style: theme.textTheme.headline6)
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('TRY QUICK DEMO', style: theme.textTheme.headline6),
          )
        ],
      )),
    );
  }
}
