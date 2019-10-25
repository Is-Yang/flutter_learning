import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  DetailPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页面"),
      ),
      body: new 
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 30.0),
            child: new Column(
              children: <Widget>[
                Text('标题: ${this.title}'),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context, "我是返回值"),
                    child: Text("返回"),
                  )
              ],
            ),
      )
    );
  }
}