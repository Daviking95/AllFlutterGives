import 'package:all_flutter_gives/FoodAppUI/screens/landing_screen.dart';
import 'package:all_flutter_gives/FoodAppUI/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Based on this Youtube tutorial
// https://www.youtube.com/watch?v=SYtlmeznJhk

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: COLOR_GREEN));
    return LayoutBuilder(builder: (context, constraints) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Screen 2',
        theme: ThemeData(textTheme: defaultText),
        home: LandingScreen(),
      );
    });
  }
}