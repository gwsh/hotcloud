import 'package:flutter/material.dart';

import 'hotcloud_global.dart';

class Global {
  /// 全局context上下文
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final bool isPrintLogger = false;
  final bool isDebug = false;
  final ModelType model = ModelType.pro;

//  static Future<bool> init({bool isPrintLogger, bool isDebug}) {
//    isPrintLogger = isPrintLogger;
//    isDebug = isDebug;
//    return true;
//  }
}
