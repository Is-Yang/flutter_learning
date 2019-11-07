import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../chapter_01/main.dart' as page1;
import '../chapter_02/list_page.dart';
import '../chapter_03/detail_page.dart';
import '../chapter_04/index_page.dart' as page4;

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('列表')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person_solid),
      title: Text('个人中心')
    )
  ];

  final List tabBodies = [
    page4.IndexPage(),
    ListPage(),
    // DetailPage('1')
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '底部导航BottomNavigationBar',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        // appBar: new AppBar(
        //   title: Text('底部导航BottomNavigationBar'),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          fixedColor: Colors.blue,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[currentIndex];
            });
          },
        ),
        body: currentPage,
      ),
    );
  }
}
