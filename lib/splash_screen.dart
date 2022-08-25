import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'layout/home_layout.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image(image: AssetImage('assets/images/logo.png'),
      height: 110,
      color: Color(0xff004D40),),
      title: Text(
        "Taskoo",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xff004D40),
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: false,
      // loadingText: Text('Loading',style: TextStyle(color: Color(0xff004D40),),),
      // loaderColor: Color(0xff004D40),
      navigator: HomeLayout(),
      durationInSeconds: 4,
    );
  }
}