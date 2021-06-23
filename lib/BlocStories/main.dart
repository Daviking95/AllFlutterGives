import 'package:all_flutter_gives/BlocStories/screens/albums_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/album_services.dart';
import 'bloc/album/bloc.dart';


// todo : source => https://itnext.io/bloc-pattern-in-flutter-explained-with-real-example-a858e69eb5b8
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
        child: AlbumsScreen(),
      ),
    );
  }
}
