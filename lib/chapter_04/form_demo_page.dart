import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 获取输入内容
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '表单form',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: Text('表单form'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: <Widget>[
                TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        icon: Icon(Icons.person)
                    ),
                    // 校验用户名
                    validator: (v) {
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    }

                ),
                TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                    //校验密码
                    validator: (v) {
                      return v.trim().length > 5 ? null : "密码不能少于6位";
                    }
                ),
                // 登录按钮
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if((_formKey.currentState as FormState).validate()){
                              //验证通过提交数据
                              _handleLogin(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void _handleLogin(BuildContext context) {
    getHttp(_unameController.text.toString(), _pwdController.text.toString()).then((data){
      print(data);
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
