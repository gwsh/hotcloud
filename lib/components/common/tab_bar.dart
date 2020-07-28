import 'package:flutter/material.dart';
import 'package:hotcloud/common/global.dart';
import 'package:hotcloud/view/main_page.dart';
import 'package:hotcloud/view/me_page.dart';

///
/// @gwsh（shundong106@gmail.com)
/// @date 2020-05-21
/// @description
/// * <p> tabs 涉及到一个App常见的
/// *   嵌套路由app底部的
/// * </p>
class SdTabBar extends StatefulWidget {
  /// 当前的一个Tab索引
  final int tab;

  /// 默认为首页
  SdTabBar({this.tab = 0});

  @override
  SdTabBarState createState() => SdTabBarState();
}

class SdTabBarState extends State<SdTabBar> {
  BuildContext context;

  /// 底部的Tab数量
  /// 后期需求更变只需要
  /// 添加对应的模板即可

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      selectedItemColor: Theme.of(context).selectedRowColor,
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: (tab) {
        SwitchTabNotification(tab).dispatch(context);
      },
      currentIndex: widget.tab,
      type: BottomNavigationBarType.fixed,
      items: Tabs.getTabs(context)
          .map(
            (v) => BottomNavigationBarItem(
              icon: v['icon'],
              title: v['title'],
            ),
          )
          .toList(),
    );
  }
}

/// 通知对象 告诉上层 我们切换到 那个IndexState tab
/// 其实市面上的一些
class SwitchTabNotification extends Notification {
  final int tab;

  // 构造函数
  SwitchTabNotification(this.tab);
}

/// tabs
class Tabs {
  static List<dynamic> getTabs(BuildContext context) {
    var tabs = [
      {
        'title': Text(
          "首页",
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.subtitle1.color,
          ),
        ),
        'icon': Icon(
          Icons.home,
          size: 28,
        ),
        'builder': (BuildContext context) => MainPage(),
      },
      {
        'title': Text(
          "我的",
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.subtitle1.color,
          ),
        ),
        'icon': Icon(
          Icons.account_circle,
          size: 28,
        ),
        'builder': (BuildContext context) => MePage(),
      },
    ];
    return tabs;
  }
}
