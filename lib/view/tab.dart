import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

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

  DateTime _lastPressedAt; //上次点击时间
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //2次点击间隔超过1秒则重新记时
          _lastPressedAt = DateTime.now();
          print("false");
          fToast.showToast(
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .6,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  "重复两次将推出软件~",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            gravity: ToastGravity.TOP,
            toastDuration: Duration(seconds: 2),
          );
          return Future.value(false);
        }
        Navigator.of(context).maybePop();
        return Future.value(true);
      },
      child: NotificationListener<SwitchTabNotification>(
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
      ),
    );
  }
}
