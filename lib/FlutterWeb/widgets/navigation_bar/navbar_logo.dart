
import 'package:all_flutter_gives/FlutterWeb/locator.dart';
import 'package:all_flutter_gives/FlutterWeb/routing/route_names.dart';
import 'package:all_flutter_gives/FlutterWeb/services/navigation_service.dart';
import 'package:flutter/material.dart';

Widget navigationBarLogo() => GestureDetector(
  onTap: () => locator<NavigationService>().navigateTo(HomeRoute),
  child:   SizedBox(
      height: 80,
      width: 150,
      child: Image.asset('assets/logo.png'),
    ),
);