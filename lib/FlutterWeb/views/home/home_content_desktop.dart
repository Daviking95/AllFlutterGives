
import 'package:all_flutter_gives/FlutterWeb/widgets/call_to_action/call_to_action.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

class HomeForDesktopScreens extends StatelessWidget {
  const HomeForDesktopScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CourseDetails(),
        Expanded(
            child: Center(child: CallToAction("Join The Winning Team")))
      ],
    );
  }
}
