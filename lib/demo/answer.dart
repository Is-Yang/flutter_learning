import 'package:flutter/material.dart';

class AnswerPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  List checkList;

  @override
  void initState() {
    super.initState();

    checkList = [
        {
          'label': '苹果',
          'check': true
        },
        {
          'label': '香蕉',
          'check': false
        },
        {
          'label': '葡萄',
          'check': true
        }
      ];
  }

  Widget _buildCheckboxList() {
    List<Widget> items = [];

    Widget content;
    for (var i = 0; i < checkList.length; i++) {
      items.add(
        new Row(
          children: <Widget>[
            Text(checkList[i]['label']),
            Checkbox(
              value: checkList[i]['check'],
              onChanged: (value) {
                this.setState(() {
                  checkList[i]['check'] = value;
                });
                print(this.checkList);
              },
            )
          ],
        )
      );
    }

    content = new Row(
      children: items,
    );

    return content;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('遗留问题'),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text('按钮圆角以及图标按钮')
            ),
            new Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                    child: RaisedButton(
                      child: Text('圆角按钮'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {},
                    ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.edit),
                      label: Text('图标圆角按钮'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onPressed: () {},
                    ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text('引入图片资源, 只需配置图片文件夹, 也可访问')
            ),
            new Row(
              children: <Widget>[
                Image.asset('assets/images/icon_file.png', width: 60,),
                Image.asset('assets/images/icon_pdf.png', width: 60,),
                Image.asset('assets/images/icon_png.png', width: 60,)
              ],
            ),  
            Padding(
              padding: EdgeInsets.all(15),
              child: Text('Checkbox多个绑定值')
            ),
            _buildCheckboxList()
          ],
        ),
      ) 
    );
  }

}