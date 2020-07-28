import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hotcloud/view/main_page.dart';
import 'package:hotcloud/view/tab.dart';

class Routes {
  static const String main_page = "/main/mainPage";
  static const String tab_page = "/main/TabPage";

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
    }
    return _page;
  }
}
