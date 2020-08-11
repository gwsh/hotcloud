import 'dart:io';

import 'package:baidu_face_flutter/baidu_face_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hotcloud/common/global.dart';
import 'package:provider/provider.dart';
import 'common/routes.dart';
import 'utils/new_observer.dart';
import 'view/splash_page.dart';
import 'viewmodel/theme_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 人脸识别初始化
  final config = Config(livenessTypeList: [LivenessType.Eye]);
  if (Platform.isAndroid) {
    await BaiduFace.instance.init('hotcloud-face-android', config: config);
  } else if (Platform.isIOS) {
    await BaiduFace.instance.init('hotcloud-face-ios', config: config);
  }
//  Global.init(isPrintLogger: false).then((value) {
//    runApp(
//      RestartWidget(
//        child: MyApp(),
//      ),
//    );
//  });
  runApp(
    RestartWidget(
      child: MyApp(),
    ),
  );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeViewModel>(
      create: (_) => ThemeViewModel(),
      child: Builder(
        builder: (context) => MaterialApp(
//          navigatorKey: Global.navigatorKey,
          onGenerateRoute: (settings) {
            return Routes.findRoutes(settings);
          },
          onUnknownRoute: (settings) {
            return Routes.findRoutes(settings);
          },
//          showPerformanceOverlay: true,
//          debugShowMaterialGrid: true,
          navigatorObservers: <NavigatorObserver>[NewObserver()],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Provider.of<ThemeViewModel>(context, listen: true).themeData,
          home: SplashPage(),
        ),
      ),
    );
  }
}
