
import 'package:all_flutter_gives/FlutterWeb/widgets/call_to_action/call_to_action.dart';
import 'package:all_flutter_gives/FlutterWeb/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

class HomeForMobileScreens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CourseDetails(),
        SizedBox(height: 30,),
        Center(child: CallToAction("Join The Winning Team"))
      ],
    );
  }
}
