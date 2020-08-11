import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotcloud/common/routes.dart';
import 'package:hotcloud/components/components.dart';
import 'package:hotcloud/viewmodel/theme_view_model.dart';
import 'package:hotcloud/widgets/hot_cloud_appbar.dart';
import 'package:provider/provider.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: HotCloudAppbar(
        title: "我的",
        canBack: false,
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
      body: InkWell(
        onTap: () {
          Navigator.of(context).push(Routes.findRoutes(RouteSettings(name: Routes.test1_page,arguments: {"tab":1,"from":"123"})));
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "点我测试1->MePage",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      bottomNavigationBar: SdTabBar(
        tab: 1,
      ),
    );
  }
}
