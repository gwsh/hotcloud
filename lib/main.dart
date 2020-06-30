import 'dart:io';

import 'package:baidu_face_flutter/baidu_face_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/routes.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeViewModel>(
      create: (_) => ThemeViewModel(),
      child: Builder(
        builder: (context) => MaterialApp(
          onGenerateRoute: (settings) {
            return Routes.finadRoutes(settings);
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Provider.of<ThemeViewModel>(context, listen: true).themeData,
          home: SplashPage(),
        ),
      ),
    );
  }
}
