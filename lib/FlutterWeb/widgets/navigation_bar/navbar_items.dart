import 'package:all_flutter_gives/FlutterWeb/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

Widget navigationBarItems(String title, String navigationPath) => GestureDetector(
  onTap: () {
    locator<NavigationService>().navigateTo(navigationPath);
  },
  child:   Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
);
