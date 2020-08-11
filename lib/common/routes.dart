import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hotcloud/test/test.dart';
import 'package:hotcloud/view/main_page.dart';
import 'package:hotcloud/view/tab.dart';

class Routes {
  static const String main_page = "/main/mainPage";
  static const String tab_page = "/main/TabPage";
  static const String test1_page = "/main/Test1Page";
  static Route findRoutes(RouteSettings setting) {
    String name = setting.name;

    Object argument = setting.arguments;

    return CupertinoPageRoute(builder: (_) {
      return _findPage(name, argument);
    });
  }

  static Widget _findPage(String name, object) {
    Widget _page;
    switch (name) {
      case main_page:
        _page = MainPage();
        break;
      case tab_page:
        _page = TabPage();
        break;
      case test1_page:
        _page = TestPage(tab: object["tab"],from: object["from"],);
        break;
    }
    return _page;
  }
}
