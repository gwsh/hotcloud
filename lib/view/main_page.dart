import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotcloud/common/global.dart';
import 'package:hotcloud/common/image_cache_widget.dart';
import 'package:hotcloud/common/multi_state_widget.dart';
import 'package:hotcloud/common/provider_widget.dart';
import 'package:hotcloud/components/components.dart';
import 'package:hotcloud/model/subject_entity.dart';
import 'package:hotcloud/utils/baidu_face_util.dart';
import 'package:hotcloud/viewmodel/subjects_view_model.dart';
import 'package:hotcloud/viewmodel/theme_view_model.dart';
import 'package:hotcloud/widgets/hot_cloud_appbar.dart';
import 'package:provider/provider.dart';
import '../main.dart';

/// 首页
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Size _screen;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: HotCloudAppbar(
        title: "电影",
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
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: _screen.height * 0.4,
              child: ProviderWidget<SubjectsViewModel>(
                model: SubjectsViewModel(),
                onReady: (model) {
                  model.load();
                },
                builder: (context, model, child) {
                  return MultiStateWidget(
                    builder: (context) =>
                        _buildSubjectWidget(model.subjectEntity),
                    state: model.state,
                  );
                },
              ),
            ),
            RaisedButton(
              onPressed: () {
                BaiduFaceUtil.handleVerify(context);
              },
              color: Theme.of(context).buttonColor,
              child: Text(
                "活体测试",
                style: TextStyle(
                  color: Theme.of(context).textTheme.subtitle1.color,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                RestartWidget.restartApp(context);
              },
              color: Theme.of(context).buttonColor,
              child: Text(
                "重启APP",
                style: TextStyle(
                  color: Theme.of(context).textTheme.subtitle1.color,
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: SdTabBar(
        tab: 0,
      ),
    );
  }

  Widget _buildSubjectWidget(SubjectEntity subjectEntity) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "豆瓣高分",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.subtitle1.color,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 20.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                ),
                Text(
                  "查看更多",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 20.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: subjectEntity.subjects.length,
              itemBuilder: (context, index) {
                var bean = subjectEntity.subjects[index];
                return Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: ImageCacheWidget(
                                    imgUrl: bean.cover,
                                    width: _screen.height <= 700
                                        ? _screen.width * 0.35
                                        : _screen.width * 0.45,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 0),
                                child: Text(
                                  "${bean.title}",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .color,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              RatingBar(
                                initialRating: double.parse(bean.rate) / 2.0,
                                minRating: 1.0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 14,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
//                                onRatingUpdate: (rating) {
//                                  print(rating);
//                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
