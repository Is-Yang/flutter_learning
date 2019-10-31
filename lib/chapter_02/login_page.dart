import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './config/httpHeaders.dart';
import '../routers/application.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 获取输入内容
  TextEditingController userController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'post请求示例',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: Text('post请求示例'),
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: userController,
              // 用于控制TextField的外观显示
              decoration: InputDecoration(
                labelText: '账号',
                hintText: '请输入账号',
                prefixIcon: Icon(Icons.person)
              )
            ),
            new TextField(
              controller: pwdController,
              // 用于控制TextField的外观显示
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new RaisedButton(
                      child: Text('登录'),
                      color: Colors.green,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      onPressed: () {
                        _handleLogin(context);
                      },
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

    void _handleLogin(BuildContext context) {
    getHttp(userController.text.toString(), pwdController.text.toString()).then((data){
      if (data['code'] != 200) {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text('提示'),
            content: Text(data['msg']),
          )
        );
        return;
      } 
      if (data['code'] == 200) {
        // showDialog(
        //   context: context,
        //   builder: (context) => new AlertDialog(
        //     title: Text('提示'),
        //     content: Text("登录成功，公司名称；" + data['data']['area']['fullName']),
        //   )
        // );
        Navigator.of(context).pushNamed('/home', arguments: data['data']['area']['fullName']);
        // Application.router.navigateTo(context, "/detail/1");
      }
      
    }).whenComplete(() {
      // showDialog(
      //   context: context,
      //   builder: (context) => new UnconstrainedBox(
      //     child: AlertDialog(
      //       content: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: <Widget>[
      //           CircularProgressIndicator(value: .8),
      //           Padding(
      //             padding: const EdgeInsets.only(top: 26.0),
      //             child: Text('正在加载，请稍后'),
      //           )
      //         ],
      //       ),
      //     ),
      //   )
      // );
    });
  }

  Future getHttp(String username, String password) async {
    try {
      Response response;
      Dio dio = new Dio();
      // dio.options.headers = httpHeaders;
      // dio.interceptors.add(InterceptorsWrapper(
      //   onResponse: (Response response){
      //     return response;
      //   }
      // ));
      FormData formData = new FormData.from({
        'username': username,
        'password': password,
        'znkl': 1
      });
      response = await dio.post('http://klapi.test-chexiu.cn/site/login',
        data: formData
      );
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

}
