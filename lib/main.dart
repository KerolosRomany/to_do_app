import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/layout/home_layout.dart';
import 'package:to_do_app/modules/login/login_screen.dart';
import 'modules/splash/splash_screen.dart';


void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(splash: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Image(image: AssetImage('assets/images/todo.png'), )
        ),
      ),nextScreen: Login()),
    );
  }
}
