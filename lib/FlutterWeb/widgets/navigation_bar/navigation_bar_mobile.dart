
import 'package:flutter/material.dart';

import 'navbar_logo.dart';

class NavigationBarMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          navigationBarLogo(),
        ],
      ),
    );
  }
}
