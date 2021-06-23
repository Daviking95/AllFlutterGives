import 'package:all_flutter_gives/BlocStories/bloc/album/bloc.dart';
import 'package:all_flutter_gives/BlocStories/bloc/album/events.dart';
import 'package:all_flutter_gives/BlocStories/bloc/album/states.dart';
import 'package:all_flutter_gives/BlocStories/model/album_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  //
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    context.bloc<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (BuildContext context, AlbumsState state) {
          if (state is AlbumsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return Text(message);
          }
          if (state is AlbumsLoaded) {
            List<Album> albums = state.albums;
            return _list(albums);
          }
          return CircularProgressIndicator();
        }),
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return Text(album.title);
        },
      ),
    );
  }
}
