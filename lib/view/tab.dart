import 'package:flutter/material.dart';

import '../components/components.dart';

/// 外层底部导航器
class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  /// 默认第一个Tab可见
  var _tab = 0;

  bool _handleSwitchTabNotificatio(SwitchTabNotification notification) {
    setState(() {
      _tab = notification.tab;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SwitchTabNotification>(
      child: IndexedStack(
        index: _tab,
        children: Tabs.getTabs(context)
            .map(
              (v) => Navigator(
                onGenerateRoute: (settings) {
                  WidgetBuilder builder;
                  switch (settings.name) {
                    case '/':
                      builder = v['builder'];
                      break;
                    default:
                      throw Exception("Unknown route: ${settings.name}");
                  }
                  return MaterialPageRoute(
                      builder: builder, settings: settings);
                },
              ),
            )
            .toList(),
      ),
      onNotification: _handleSwitchTabNotificatio,
    );
  }
}
