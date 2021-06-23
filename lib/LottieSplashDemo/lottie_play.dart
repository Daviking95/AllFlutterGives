import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:velocity_x/velocity_x.dart';

class LottieSplashPlay extends StatelessWidget {
  //todo :=> Source : https://www.filledstacks.com/post/lottie-splash-screen-intro-in-flutter/
  // todo :=> https://lottiefiles.com/search?q=login&category=animations
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Vx.gray200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/login_anim.json'),
              Expanded(
                child: Container(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NeuText('WELCOME TO MY APP',
                      spread: 0.5,
                      parentColor: Colors.blueGrey,
                      emboss: true,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Vx.blue600)),
                  Text(
                    "This is an interesting animation display app",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Vx.gray500),
                  ),
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      Positioned(
                        child: NeuTextField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Write',
                          ),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          bottom: -4,
                          child: Icon(Icons.person_rounded)),
                    ],
                  ),
                  SizedBox(height: 30,),
                  NeuButton(
                    onPressed: () {
                      print('Pressed !');
                    },
                    decoration: NeumorphicDecoration(
                      color: Vx.blue600,
                        borderRadius: BorderRadius.circular(3)
                    ),
                    child: Text('Login', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Vx.white)),
                  ),
                ],
              ).p16(),
            ],
          ),
        ),
      ),
    );
  }
}
