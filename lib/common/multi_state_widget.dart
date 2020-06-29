import 'package:flutter/material.dart';
import 'package:hotcloud/api/base_state.dart';
import 'package:hotcloud/utils/otherview/other_view.dart';

typedef Content = Widget Function(BuildContext context);

// ignore: must_be_immutable
class MultiStateWidget extends StatefulWidget {
  Widget loadingWidget;
  Widget emptyWidget;
  Widget failWidget;
  Content builder;
  BaseState state;

  MultiStateWidget({
    Key key,
    Content builder,
    this.state,
    this.loadingWidget,
    this.emptyWidget,
    this.failWidget,
  }) : super(key: key) {
    if (state == BaseState.CONTENT) {
      if (builder != null) {
        this.builder = builder;
      }
    }
    if (emptyWidget == null) {
      emptyWidget = EmptyStateWidget();
    }
    if (failWidget == null) {
      failWidget = ErrorStateWidget();
    }
    if (loadingWidget == null) {
      loadingWidget = LoadingStateWidget();
    }
  }

  @override
  _MultiStateWidgetState createState() => _MultiStateWidgetState();
}

class _MultiStateWidgetState extends State<MultiStateWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    if (widget.state == BaseState.CONTENT) {
      return widget.builder(context);
    } else if (widget.state == BaseState.EMPTY) {
      return widget.emptyWidget;
    } else if (widget.state == BaseState.FAIL) {
      return widget.failWidget;
    } else {
      return widget.loadingWidget;
    }
  }
}
