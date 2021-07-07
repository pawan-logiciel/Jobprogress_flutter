import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:loadmore/loadmore.dart';
import 'package:shimmer/shimmer.dart';

import './shimmer_layout.dart';
import './drawer.dart';
import '../size_config.dart';
import '../popover/index.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoaded = true;
  int get count => entries.length;
  // This widget is the root of your application.
  List<int> entries = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 1];

  GlobalKey _key;
  bool isMenuOpen = false;
  Offset buttonPosition;
  Size buttonSize;
  OverlayEntry _overlayEntry;

  void initState() {
    super.initState();
    _key = LabeledGlobalKey("button_icon");

    // list.addAll(List.generate(30, (v) => v));
  }

  void load() {
    print("load");
    setState(() {
      entries.addAll(List.generate(15, (v) => v));
      print("data count = ${entries.length}");
    });
  }
  
  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

    void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu(context) {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
  print("ORIORO ${MediaQuery.of(context).orientation}");

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                print(_scaffoldKey.currentState);
                _scaffoldKey.currentState.openEndDrawer();
              },
              child: Icon(Icons.add_circle),
            )),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 16,),
              ),
              Text('Tasks', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),)
              // Your widgets here
            ],
          ),
          titleSpacing: 0,
          backgroundColor: Colors.red[900],
          centerTitle: false,
        ),
      ),
      endDrawer: NavDrawer(),
      body: SafeArea(
        child: Container(
          child: (Column(
            children: [
              Container(
                key: _key,
                height: 44.0,
                color: Color.fromRGBO(233, 235, 239, 1),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              openMenu(context);
                            },
                            child: Text(
                              'My Pending Task',
                              style: TextStyle(fontSize: 12, color: Color.fromRGBO(69, 79, 99, 1))
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Color.fromRGBO(69, 79, 99, 1), size: 18,)
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Due Date',
                            style: TextStyle(fontSize: 12, color: Color.fromRGBO(69, 79, 99, 1))
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Color.fromRGBO(69, 79, 99, 1), size: 18),
                          Icon(Icons.sort, color: Color.fromRGBO(69, 79, 99, 1), size: 18),
                        ],
                      )
                    ],
                  ),
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
                      child: !isLoaded
                          ? ShimmerList()
                          : entries.length > 0
                              ? ListView.separated(
                                  itemCount: entries.length,
                                  padding: EdgeInsets.zero,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(height: 2),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: Color.fromRGBO(200, 24, 24, 1), width: 3, style: BorderStyle.solid)
                                        )
                                      ),
                                      padding: EdgeInsets.all(10.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: Icon(index % 2 == 0 ? Icons.check_box_rounded : Icons.check_box_outline_blank, color: Color.fromRGBO(53, 126, 189, 1),),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 40),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Title',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500
                                                          ),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Icon(Icons.attachment_outlined),
                                                      ],
                                                    ),
                                                    Text(
                                                      '3 Years ago',
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(84, 98, 125, 1),
                                                        fontSize: 12
                                                      )
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        'Job Address: 15545 Northwest 122nd Avenue, Hialeah 33018',
                                                        maxLines: 3,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(84, 98, 125, 1)
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Due Date: 15/10/2021',
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(84, 98, 125, 1),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text('|', style: TextStyle(fontSize: 12),),
                                                    SizedBox(width: 3),
                                                    Text('Contract', style: TextStyle(color: Colors.blue, fontSize: 12)),
                                                    SizedBox(width: 3),
                                                    Icon(Icons.lock, size: 15, color: Color.fromRGBO(112, 112, 112, 1)),
                                                    Spacer(),
                                                    Container(
                                                      height: 24,
                                                      width: 24,
                                                      child: Icon(Icons.notifications, size: 15, color: Color.fromRGBO(84, 98, 125, 1),),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(235, 235, 239, 1),
                                                        borderRadius: BorderRadius.all(Radius.circular(50))
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(200,27,27,.16),
                                                        borderRadius: BorderRadius.circular(4)
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.arrow_upward, size: 15, color: Color.fromRGBO(200, 27, 27, 1),),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            'High Priority',
                                                            style: TextStyle(
                                                              fontSize: 12, color: Color.fromRGBO(69, 79, 99, 1)
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
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
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: buttonSize.width,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    child: Container(
                      width: 17,
                      height: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Theme(
                      data: ThemeData(
                        iconTheme: IconThemeData(
                          color: Colors.red,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(8, (index) {
                          return GestureDetector(
                            child: Container(
                              width: buttonSize.width,
                              height: buttonSize.height,
                              child: Text('Hello'),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
    entries.clear();
    setState(() => isLoaded = false);
    await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
    setState(() => isLoaded = true);
    load();
  }
}