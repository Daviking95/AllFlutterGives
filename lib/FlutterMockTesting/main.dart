import 'package:flutter/material.dart';

import 'UI/app_theme.dart';
import 'UI/views/product_list_view.dart';
import 'helpers/dependency_assembly.dart';

void main() {
  setupDependencyAssembler();

  runApp(ShopNBuyApp());
}

class ShopNBuyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: ProductListView(),
    );
  }
}
