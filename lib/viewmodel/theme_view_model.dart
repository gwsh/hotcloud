import 'package:flutter/material.dart';
import 'package:hotcloud/common/base_view_model.dart';

class ThemeViewModel extends BaseViewModel {
  ThemeData themeData = lignt();
  bool liginte = true;

  chnageTheme() {
    if (liginte) {
      themeData = dark();
    } else {
      themeData = lignt();
    }
    liginte = !liginte;
    notifyListeners();
  }

  static ThemeData lignt() {
    return ThemeData(
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.black, fontSize: 16),
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: Color(0xff248bfe),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.black,
      brightness: Brightness.light,
      primaryColor: Color(0xff000000),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
