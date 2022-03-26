
import 'package:all_flutter_gives/FlutterWeb/routing/route_names.dart';
import 'package:flutter/material.dart';

import '../navbar_item/navbar_items.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navigationBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavBarItem('Episodes', EpisodesRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About', AboutRoute)
            ],
          )
        ],
      ),
    );
  }
}
