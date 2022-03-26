import 'package:all_flutter_gives/FlutterWeb/datamodels/season_details_model.dart';
import 'package:all_flutter_gives/FlutterWeb/viewmodels/episodes_view_model.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/episodes_list/episodes_list.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/season_details/season_details.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class FlutterWebEpisodesScreen extends StatelessWidget {
  const FlutterWebEpisodesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodesViewModel>.withConsumer(
      viewModelBuilder: () => EpisodesViewModel(),
      onModelReady: (model) => model.getEpisodes(),
      builder: (context, model, child) => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SeasonDetails(
            details: SeasonDetailsModel(
              title: 'SEASON 1',
              description:
                  'This season covers the absolute basics of Flutter Web Dev to get us up and running with a basic web app.',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          model.episodes == null
              ? CircularProgressIndicator()
              : EpisodesList(
                  episodes: model.episodes,
                ),
        ],
      )),
    );
  }
}
