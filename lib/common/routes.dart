import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hotcloud/view/main_page.dart';

class Routes {
  static const String main_page = "/main/mainPage";

  static Route finadRoutes(RouteSettings setting) {
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
    }
    return _page;
  }
}
