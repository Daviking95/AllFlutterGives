

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:velocity_x/velocity_x.dart';

class NeomorphismLogin extends StatefulWidget {
  @override
  _NeomorphismLoginState createState() => _NeomorphismLoginState();
}

class _NeomorphismLoginState extends State<NeomorphismLogin> {

  int switchValue = 0;
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Breaking news from VelocityX - v1.0.0 Released".marquee().h10(context),

              NeuCard(
                // State of Neumorphic (may be convex, flat & emboss)
                  curveType: CurveType.emboss,

                  // Elevation relative to parent. Main constituent of Neumorphism
                  bevel: 2,
                  width: Get.width,
                  height: 40,
                  // Specified decorations, like `BoxDecoration` but only limited
                  decoration: NeumorphicDecoration(
                      borderRadius: BorderRadius.circular(3)
                  ),

                  // Other arguments such as margin, padding etc. (Like `Container`)
                  child: Text('Container').p12().centered(),
              ),
              SizedBox(height: 40,),
              NeuButton(
                onPressed: () {
                  print('Pressed !');
                },
                decoration: NeumorphicDecoration(
                    borderRadius: BorderRadius.circular(3)
                ),
                child: Text('Button'),
              ),
              SizedBox(height: 20,).expand(flex: 1),
              NeuSwitch<int>(
                onValueChanged: (val) {
                  setState(() {
                    switchValue = val;
                  });
                },
                groupValue: switchValue,
                children: {
                  0: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    child: Text('First'),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    child: Text('Second'),
                  ),
                },
              ),
              SizedBox(height: 20,),
              NeuText('Lorem Ipsum', parentColor: Colors.green,emboss: true,),
              SizedBox(height: 20,),
              NeuTextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
