import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../chapter_02/login_page.dart';
import '../chapter_03/detail_page.dart';

Handler detailsHandle = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String goodsId = params['title'][0];
    return DetailPage(goodsId);
  }
);

Handler loginHandle = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  }
);
