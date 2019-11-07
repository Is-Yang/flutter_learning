import 'package:flutter/material.dart';

class ParentChildPage extends StatefulWidget {
  @override
  _ParentChildPageState createState() => new _ParentChildPageState();
}

class _ParentChildPageState extends State<ParentChildPage> {
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

class ChildPage extends StatefulWidget {
  ChildPage({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  bool flag = false;

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleLongPress() {
    this.setState(() {
      this.flag = !this.flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onLongPress: _handleLongPress,
      onTap: _handleTap,
      child: new Column(
        children: <Widget>[
          Container(
            child: new Center(
              child: new Text(
                widget.active ? 'Active' : 'Inactive',
                style: new TextStyle(
                  fontSize: 32.0, 
                  color: flag ? Colors.white : Colors.red
                ),
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