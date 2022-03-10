
import 'package:flutter/material.dart';
import 'package:to_do_app/layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goHome();
  }
  goHome() async{
    await Future.delayed(Duration(seconds: 5),(){});
    Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeLayout()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Splash',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
