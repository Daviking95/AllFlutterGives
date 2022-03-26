import 'package:all_flutter_gives/FlutterWeb/widgets/navigation_bar/navbar_logo.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/navigation_bar/navigation_bar_tablet_desktop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../navbar_item/navbar_items.dart';
import 'navigation_bar_mobile.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
