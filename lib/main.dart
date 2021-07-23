import 'package:all_flutter_gives/DesignSystemFlutter/flutter_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'FlutterWeb/locator.dart';
import 'FlutterWeb/views/home/home_view.dart';
import 'FlutterWeb/views/layout_template/layout_template.dart';

void main() {
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
        home:
        FlutterWebLayoutTemplate() // FlutterDesignSample() //  // SembastHomeScreen()
        // BlocProvider(
        //   create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
        //   child: AlbumsScreen(),
        // )
        // LottieSplashPlay(),
        );
  }
}
