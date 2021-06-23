import 'package:all_flutter_gives/DesignSystemFlutter/flutter_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
            FlutterDesignSample() // FlutterWebHomeScreen() // SembastHomeScreen()
        // BlocProvider(
        //   create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
        //   child: AlbumsScreen(),
        // )
        // LottieSplashPlay(),
        );
  }
}
