import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotcloud/components/components.dart';
import 'package:hotcloud/viewmodel/theme_view_model.dart';
import 'package:hotcloud/widgets/hot_cloud_appbar.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  final String from;
  final int tab;

  const TestPage({Key key, this.from, this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: HotCloudAppbar(
        title: "电影",
        canBack: true,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Provider.of<ThemeViewModel>(context, listen: false).chnageTheme();
            },
            child: Container(
              width: ScreenUtil().setWidth(100),
              child: Icon(
                Icons.lightbulb_outline,
              ),
            ),
          ),
        ],
      ).build(context),
      body: Container(
        alignment: Alignment.center,
        child: Text("我来自于 $from"),
      ),
      bottomNavigationBar: SdTabBar(
        tab: tab,
      ),
    );
  }
}
