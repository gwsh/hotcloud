import 'package:flutter/material.dart';
import 'package:hotcloud/components/components.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MePage"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: Text("MePage"),
      ),
      bottomNavigationBar: SdTabBar(
        tab: 1,
      ),
    );
  }
}
