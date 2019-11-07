import 'package:flutter/material.dart';

class ParentStatePage extends StatefulWidget {
  @override
  _ParentStatePageState createState() => new _ParentStatePageState();
}

class _ParentStatePageState extends State<ParentStatePage> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ChildPage(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class ChildPage extends StatelessWidget {
  ChildPage({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Column(
        children: <Widget>[
          Container(
            child: new Center(
              child: new Text(
                active ? 'Active' : 'Inactive',
                style: new TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
            width: 200.0,
            height: 200.0
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