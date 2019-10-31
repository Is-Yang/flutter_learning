import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class PYQPage extends StatefulWidget {
  @override
  _PYQPageState createState() => _PYQPageState();
}

class _PYQPageState extends State<PYQPage> {
  TouchMovePainter painter;
  // 屏幕宽度, offset
  static double _width = window.physicalSize.width / (window.devicePixelRatio);
  // 屏幕高度, offset
  static double _height = window.physicalSize.height / (window.devicePixelRatio);  
  
  // 静止状态下的offset
  Offset idleOffset = Offset(_width / 2 - 30, _height / 2 - 30 - 48);
  Offset moveOffset = Offset(_width / 2 - 30, _height / 2 -30 - 48);
  Offset lastStartOffset = Offset(0, 0);

  @override
  void initState() {
    painter = TouchMovePainter();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('拖动效果'),
      ),
      body: Transform.translate(
        offset: moveOffset,
        child: Container(
          width: 60,
          height: 60,
          child: GestureDetector(
            onPanStart: (detail) {
              setState(() {
                // 记录移动前的位置
                lastStartOffset = detail.globalPosition;
                painter = TouchMovePainter();
                painter.painterColor = Colors.red;
              });
            },
            onPanUpdate: (detail) {
              setState(() {
                moveOffset = detail.globalPosition - lastStartOffset + idleOffset;
                moveOffset = Offset(max(0, moveOffset.dx), max(0, moveOffset.dy));
              });
            },
            onPanEnd: (detail) {
              setState(() {
                painter = TouchMovePainter();
                painter.painterColor = Colors.green;
                idleOffset = moveOffset * 1;
              });
            },
            child: CustomPaint(
              painter: painter,
              child: Text(
                '拖动',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TouchMovePainter extends CustomPainter {
  var painter = Paint();
  var painterColor = Colors.green;

  @override
  void paint(Canvas canvas, Size size) {
    painter.color = painterColor;
    canvas.drawCircle(Offset(size.width / 5, size.height / 5), 
        min(size.height, size.width), painter);
  }

  @override
  bool shouldRepaint(TouchMovePainter oldDelegate) {
    return oldDelegate.painterColor != painterColor;
  }
}