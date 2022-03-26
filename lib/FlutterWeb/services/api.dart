import 'dart:convert';

import 'package:all_flutter_gives/FlutterWeb/datamodels/episode_item_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // @ HTTP Request level
  // 1. Make your HTTP request
  // 2. Get the formatted data back
  // 3. Serialize it and pass it down to your application and let your app decide what to do with the data.
  // You can pass it down to either BLOC file or ViewModel

  static const String _apiEndpoint =
      'https://us-central1-thebasics-2f123.cloudfunctions.net/thebasics/';

  Future<dynamic> getEpisodes() async {
    var response = await http.get(Uri.parse('$_apiEndpoint/courseEpisodes'));

    if (response.statusCode == 200) {
      var episodes = ((jsonDecode(response.body)) as List)
          .map((episode) => EpisodeItemModel.fromJson(episode))
          .toList();

      return episodes;
    }

    return 'Counld not fetch results at this time';
  }
}
