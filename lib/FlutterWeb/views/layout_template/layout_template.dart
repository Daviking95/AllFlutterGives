
import 'package:all_flutter_gives/FlutterWeb/routing/route_names.dart';
import 'package:all_flutter_gives/FlutterWeb/routing/router.dart';
import 'package:all_flutter_gives/FlutterWeb/services/navigation_service.dart';
import 'package:all_flutter_gives/FlutterWeb/views/home/home_view.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/centered_view/centered_view.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/navigation_bar/navigation_bar.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';

class FlutterWebLayoutTemplate extends StatelessWidget {
  const FlutterWebLayoutTemplate({Key key}) : super(key: key);

  // This layout template is for easy navigation between pages by using the Navigator Widget.

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: HomeRoute,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}