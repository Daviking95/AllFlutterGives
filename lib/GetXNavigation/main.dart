
import 'package:all_flutter_gives/GetXNavigation/first.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fourth.dart';
import 'second.dart';
import 'third.dart';


// todo : Source =>  https://www.youtube.com/watch?v=ttQtlX_Q0eU


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeNavigationPage(),
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
      getPages: [
        GetPage(name: '/', page: () => HomeNavigationPage()),
        GetPage(name: '/second', page: () => SecondNavigationPage()),
        GetPage(
          name: '/third',
          page: () => ThirdNavigationPage(),
          transition: Transition.zoom,
        ),
        GetPage(name: "/fourth", page: () => FourthNavigationPage()),
      ],
    );
  }
}