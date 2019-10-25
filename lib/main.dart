import 'package:flutter/material.dart';
import './chapter_01//main.dart' as chapter01;
import './chapter_02/login_page.dart';
import './chapter_02/list_page.dart';
import './chapter_03/navbar.dart';
import './chapter_03/detail_page.dart';
import 'package:flutter/widgets.dart';
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.defineRoutes(router);
    Application.router = router;

    return new MaterialApp(
      title: 'Flutter Demos',
      // onGenerateRoute: Application.router.generator,
      // home: LoginPage(),
      initialRoute: "/login",  // 初始路由
      // 注册路由表
      routes: {
        '/': (BuildContext context) => Navbar(),
        "/home": (BuildContext context) => Navbar(),
        '/list': (BuildContext context) => new ListPage(),
        '/login': (BuildContext context) =>  LoginPage()
      },
    );
  }
}