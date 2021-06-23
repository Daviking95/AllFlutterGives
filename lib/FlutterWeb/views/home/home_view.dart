import 'package:all_flutter_gives/FlutterWeb/widgets/call_to_action/call_to_action.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/centered_view/centered_view.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/course_details/course_details.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';

class FlutterWebHomeScreen extends StatelessWidget {
  //todo : To host on Firebase, run the following commands :
  // firebase init hosting
  // flutter build web
  // firebase deploy --only hosting

  // Link : https://flutterwebbasics-3dbb0.web.app/#/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
          child: Column(
        children: [
          NavigationBar(),
          Expanded(
            child: Row(
              children: [
                CourseDetails(),
                Expanded(
                    child: Center(child: CallToAction("Join The Winning Team")))
              ],
            ),
          )
        ],
      )),
    );
  }
}
