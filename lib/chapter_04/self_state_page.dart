import 'package:flutter/material.dart';

class SelfStatePage extends StatefulWidget {
  @override
  _SelfStatePageState createState() => _SelfStatePageState();
}

class _SelfStatePageState extends State<SelfStatePage> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Column(
        children: <Widget>[
          Container(
            child: new Center(
              child: Text(
                _active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            width: 200,
            height: 200,
          ),
          RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}