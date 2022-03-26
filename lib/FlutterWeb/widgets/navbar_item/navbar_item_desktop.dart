

import 'package:all_flutter_gives/FlutterWeb/datamodels/navbar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class NavBarItemTabletDesktop extends ProviderWidget<NavBarItemModel> {

  @override
  Widget build(
      BuildContext context,
      NavBarItemModel model
      ) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18),
    );
  }
}