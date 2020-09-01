
import 'package:flutter/material.dart';
import 'package:markets/src/pages/Intro.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:splashscreen/splashscreen.dart';
//import '../controllers/splash_screen_controller.dart';
import 'info.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainSplashScreenState();
  }
}

class MainSplashScreenState extends StateMVC<MainSplashScreen> {
  //SplashScreenController _con;

  /*MainSplashScreenState() : super(SplashScreenController()) {
    _con = controller;
  }*/
/*
  @override
  void initState() {
    super.initState();
    //loadData();
  }*/

  /*void loadData() {
    _con.progress.addListener(() {
      double progress = 0;
      _con.progress.value.values.forEach((_progress) {
        progress += _progress;
      });
      if (progress == 100) {
        try {
          Navigator.of(context).pushReplacementNamed('/Intro');
         // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardingPage()));
        } catch (e) {}
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new OnBoardingPage2(),
      image: Image.asset('assets/img/TAKE_SHOPPING_04.png'),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      loaderColor: Theme.of(context).accentColor,
      loadingText: Text("Loading..."),
    );


    /*Scaffold(
      key: _con.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
               //'icons/TAKE_LOGO/TAKE_SHOPPING_07.png',
                'assets/img/TAKE_SHOPPING_04.png',
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor)
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
