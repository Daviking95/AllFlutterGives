import 'dart:io';

import 'package:all_flutter_gives/DesignSystemFlutter/flutter_design_screen.dart';
import 'package:all_flutter_gives/FlutterWeb/routing/route_names.dart';
import 'package:all_flutter_gives/FlutterWeb/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'FlutterWeb/locator.dart';
import 'FlutterWeb/services/navigation_service.dart';
import 'FlutterWeb/views/home/home_view.dart';
import 'FlutterWeb/views/layout_template/layout_template.dart';
import 'FoodAppUI/screens/landing_screen.dart';
import 'InfiniteListPagination/main.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) => FlutterWebLayoutTemplate(child: child),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: HomeRoute,
        // home: FlutterWebLayoutTemplate() // FlutterDesignSample() //  // SembastHomeScreen()
        // BlocProvider(
        //   create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
        //   child: AlbumsScreen(),
        // )
        // LottieSplashPlay(),
        );
  }
}
