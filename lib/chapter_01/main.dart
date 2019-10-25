/**
 * 引用库：
 * 1. 在import语句后面需要接上库文件的路径
 * 2. 对Dart语言提供的内部库文件使用dart:xx格式  (import 'dart:io')
 * 3. 第三方的库文件使用package:xx格式 （import 'package:flutter/material.dart'）
 * 4. 引用同一包下面的dart库，如我们在lib下新增xxx.dart （import 'xxx.dart'）
 *    
 * 指定库前缀，解决冲突
 * import 'package:mylib/mylib.dart'
 * import 'package:mylib/mylib.dart as' lib2
 * 
 * Element element1 = new Element();
 * lib2.Element element2 = new lib2.Element();
 * 
 * 引用库的一部分：
 * import 'package:mylib/mylib.dart' show foo  -> 只引用foo部分
 * import 'package:mylib/mylib.dart' hide foo  -> 除foo部分之外都引用
 * 
 * 库懒加载，只会在该库被使用时得到加载，初始化时不加载
 * import 'package:mylib/mylib.dart' deferred as lib;
 * 
 */
import 'package:flutter/material.dart';

/// 程序入口函数 main 中只会调用runApp函数
// void main() {
//   return runApp(MyApp());
// }
void main() => runApp(MyApp());

/**
 * StatelessWidget 表示无状态组件
 *  无状态组件即界面不发生变化的组件 （AssetImage, Text....）
 *  MyApp 不需要做状态处理，所以此组建继承StatelessWidget即可
 * 
 */ 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',  // 应用程序的标题
      theme: ThemeData(  // 定义主题
        primarySwatch: Colors.blue,   // 主题颜色
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),  // 定义当前应用打开时，所显示的界面，是一个Widget对象
    );
  }
}

/**
 * StatefulWidget 表示有状态组件 
 * 有状态组件是界面会发生变化的组件（Scrollable, Animatable）
 */
class MyHomePage extends StatefulWidget {
  /**
   * this.title 默认会把值赋给下面的title
   */
  MyHomePage({Key key, this.title}) : super(key: key);

  /**
   * final 常量，不可更改
   */
  final String title;

  /**
   *  所有继承自StatefulWidget的控件都要重写 createState() 这个方法
   *  在Dart中下划线开头声明的变量或方法，其默认访问权限是私有的
   *  */
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/**
 * State 状态对象 <> 里面表示该状态跟谁绑定
 * 我们修改状态时就是在该类中（MyHomePage）进行编写
 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /**
     * Scaffold 是 material中的一个模板，继承自StatefulWidget（有状态组件）
     */
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /**
       * 主体内容居中布局
       */
      body: Center(
        // Column 表示一列
        child: Column(
          // 垂直居中，类似justify-content: center
          mainAxisAlignment: MainAxisAlignment.center,
          // 子控件，是一个List类型
          children: <Widget>[
            // 文本控件
            Text(
              'You have clicke the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      // 浮动按钮控件
      floatingActionButton: new Theme(
        data: new ThemeData(
          accentColor: Colors.red,
        ),
        child: new FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// 动物类

class Animal {
    void eat() {
        print('动物会吃');
    }
    
    void run() {
        print('动物会跑');
    }
}

// 人类
class Human extends Animal {
    void say() {
        print('人类会说');
    }
    
    @override
    void eat() {
        print('人类也会吃');
    }
}

