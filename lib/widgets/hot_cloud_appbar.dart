import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotCloudAppbar {
  final String title;
  final bool canBack;
  final bool gradientBackground;
  final List<Widget> actions;

  HotCloudAppbar(
      {this.title,
      this.canBack,
      this.gradientBackground = false,
      this.actions});

  PreferredSizeWidget build(BuildContext context) {
    if (gradientBackground) {
      double w = MediaQuery.of(context).size.width * 0.48;
      return PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              child: Text(title ?? "",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center),
            ),
          ),
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.greenAccent, Colors.green]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                ),
              ]),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      );
    } else {
      return AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(title ?? ""),
        automaticallyImplyLeading: canBack,
        actions: actions,
      );
    }
  }
}
