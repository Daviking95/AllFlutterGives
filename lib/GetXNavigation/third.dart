
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'first.dart';

class ThirdNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Third Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Get.offAll(HomeNavigationPage()),
              child: Text("Go To Home"),
            )
          ],
        ),
      ),
    );
  }
}