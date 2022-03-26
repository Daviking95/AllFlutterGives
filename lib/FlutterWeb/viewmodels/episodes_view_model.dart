import 'package:all_flutter_gives/FlutterWeb/datamodels/episode_item_model.dart';
import 'package:all_flutter_gives/FlutterWeb/services/api.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class EpisodesViewModel extends ChangeNotifier {
  final _api = locator<ApiService>();

  List<EpisodeItemModel> _episodes;

  List<EpisodeItemModel> get episodes => _episodes;

  Future getEpisodes() async {
    var episodesResults = await _api.getEpisodes();

    if (episodesResults is String)
      _episodes = [];
    else
      _episodes = episodesResults;

    notifyListeners();
  }
}
