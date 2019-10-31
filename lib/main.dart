import 'package:flutter/material.dart';
import './chapter_02/login_page.dart';
import './chapter_02/list_page.dart';
import './chapter_03/navbar.dart';
import './demo/pyq_page.dart';
import './demo/answer.dart';
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
      initialRoute: "/answer",  // 初始路由
      // 注册路由表
      routes: {
        '/': (BuildContext context) => Navbar(),
        "/home": (BuildContext context) => Navbar(),
        '/list': (BuildContext context) => ListPage(),
        '/login': (BuildContext context) =>  LoginPage(),
        '/pyq': (BuildContext context) => PYQPage(),
        '/answer': (BuildContext context) => AnswerPage()
      },
    );
  }
}