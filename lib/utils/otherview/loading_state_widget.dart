import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class LoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _loading = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SkeletonAnimation(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: SkeletonAnimation(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
          ),
        ],
      ),
      alignment: Alignment.center,
    );
    return _loading;
  }
}
