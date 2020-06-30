import 'dart:convert';

import 'package:baidu_face_flutter/baidu_face_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class BaiduFaceUtil {


 static  void handleVerify(BuildContext context) async {
    try {
      final base64Image = await BaiduFace.instance.liveDetect();
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Dialog(
          child: Image.memory(base64Decode(base64Image)),
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }
}
