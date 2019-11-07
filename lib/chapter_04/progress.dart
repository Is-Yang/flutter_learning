import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";

class LoadingProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressAlert(
        loading: true,
        child: Center(),
      ),
    );
  }
}

class ProgressAlert extends StatelessWidget {
  @override

  final bool loading;

  final Widget child;

  final String msg;

  final Color textColors;

  final double alpha;

  final Widget progress;

  ProgressAlert({
    Key key,
    @required this.loading,
    @required this.child,
    this.msg = "正在加载",
    this.alpha = 0.5,
    this.progress = const CircularProgressIndicator(),
    this.textColors = Colors.white
  }); 

  Widget build(BuildContext context) {
    List<Widget>  list=[];
    list.add(child);

    if (loading){
        // 灰色层 
        list.add(
          Opacity(
            opacity: alpha,
            // ModalBarrier 防止用户在其背后与小部件交互的小部件。
            child: ModalBarrier(
              color: Colors.black,
            ),
          )
        );

        // 中间圈
        list.add(
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  progress,
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      msg, 
                      style: TextStyle(
                        color: textColors
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        );
      }
      return Stack(
        children: list,
      );
    }
}



