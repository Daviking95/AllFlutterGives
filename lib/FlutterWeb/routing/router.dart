
import 'package:all_flutter_gives/FlutterWeb/routing/route_names.dart';
import 'package:all_flutter_gives/FlutterWeb/views/about/about_view.dart';
import 'package:all_flutter_gives/FlutterWeb/views/episodes/episodes_view.dart';
import 'package:all_flutter_gives/FlutterWeb/views/home/home_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(FlutterWebHomeScreen());
    case EpisodesRoute:
      return _getPageRoute(FlutterWebEpisodesScreen());
    case AboutRoute:
      return _getPageRoute(FlutterWebAboutScreen());
    default:
      return _getPageRoute(FlutterWebHomeScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(
    child: child,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({this.child})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}