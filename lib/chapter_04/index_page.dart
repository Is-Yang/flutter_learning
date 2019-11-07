import 'package:flutter/material.dart';
import './self_state_page.dart';
import './parent_state_page.dart';
import './parent_child_page.dart';
import './form_demo_page.dart';
import './progress.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter初始状态管理',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: Text('Flutter初始状态管理'),
        ),
        body: new Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Form表单'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
            RaisedButton(
              child: Text('Widget管理自身的状态'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SelfStatePage();
                }));
              },
            ),
            RaisedButton(
              child: Text('父Widget管理子Widget的状态'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ParentStatePage();
                }));
              },
            ),
            RaisedButton(
              child: Text('混合状态'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ParentChildPage();
                }));
              },
            ),
            RaisedButton(
              child: Text('loading加载'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadingProgress();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}