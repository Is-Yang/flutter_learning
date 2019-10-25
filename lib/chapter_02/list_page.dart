import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../chapter_03/detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List showData = new List();
  @override
  void initState() {
    super.initState();
    _handleData();
  }

  Widget _buildGridList() {
    List<Widget> list = [];

    Widget content;
    for (var item in showData) {
      list.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image.network(item['cover'], fit: BoxFit.fitWidth),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: GestureDetector(
                child: Text(
                  item['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
                onTap: () async {
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                          return DetailPage(item['title']);
                      })
                  );
                  print(result);
                },
              ),
            )
          ],
        )
      );
    }
    content = new ListBody(
      children: list,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dio请求数据',
      home: Scaffold(
        appBar: AppBar(title: Text('dio请求数据'),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGridList(),
              RaisedButton(
                child: Text('加载更多'),
                onPressed: _handleData,
              ),
            ],
          ),
        ) 
      ),
    );
  }

  void _handleData() {
    print('开始请求数据.....');
    getHttp().then((data) {
      setState(() {
        showData.addAll(
          data['items'].toList()
        ); 
      });
    }).whenComplete(() {
      UnconstrainedBox(
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(value: .8),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text('正在加载，请稍后'),
              )
            ],
          ),
        ),
      );
    });
  }

  int page = 0;
  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get(
        "https://m.douban.com/rexxar/api/v2/muzzy/columns/10008/items",
        // ?start=0&count=3
        queryParameters: {
          "start": this.page++,
          "count": 5
        }
      );
    print(page);
      // print(response);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
