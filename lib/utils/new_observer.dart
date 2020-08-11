//导航的观察者
//继承NavigatorObserver
import 'package:flutter/widgets.dart';

class NewObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    print(route.settings);
    print(previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    // TODO: implement didPop
    // 当调用Navigator.pop时回调
    super.didPop(route, previousRoute);
    print(route);
    //route.currentResult获取返回内容
    print(previousRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    // TODO: implement didRemove
    // 当调用Navigator.Remove时回调
    super.didRemove(route, previousRoute);
    print(route);
    print(previousRoute);
  }
}