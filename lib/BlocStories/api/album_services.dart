import 'package:all_flutter_gives/BlocStories/model/album_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constants.dart';

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {

  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.https(AppConstants.baseUrl, AppConstants.GET_ALBUMS);
    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}
