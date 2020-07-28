import 'package:flutter/material.dart';
import 'package:hotcloud/common/base_view_model.dart';

/// 黑暗模式
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
      buttonColor: Colors.blue,
      brightness: Brightness.light,
      selectedRowColor: Colors.blueAccent,
      unselectedWidgetColor: Colors.grey,
      primaryColor: Color(0xff248bfe),
      errorColor: Colors.grey[300],
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
      buttonColor: Colors.blueGrey,
      selectedRowColor: Colors.blueGrey,
      unselectedWidgetColor: Colors.white70,
      brightness: Brightness.light,
      errorColor: Colors.indigo[300],
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
