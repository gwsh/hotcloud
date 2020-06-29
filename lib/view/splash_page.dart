import 'package:dio_log/overlay_draggable_button.dart';
import 'package:flutter/material.dart';
import 'package:hotcloud/common/routes.dart';
import 'package:hotcloud/view/main_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
//    showDebugBtn(context);
    Future.delayed(Duration(seconds: 2), () {
      /// 停顿两秒
      Navigator.of(context).pushReplacementNamed(Routes.main_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "广告页面...",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
