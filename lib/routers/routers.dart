import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handle.dart';

class Routes {
  // static String root = '/';
  static String detailPage = '/detail/:title';
  static void defineRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print('ERROR: NOTFOUND');
      }
    );
    // router.define(root, handler: loginHandle);
    router.define(detailPage, handler: detailsHandle);
  }
}
