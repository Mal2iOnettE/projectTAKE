import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:markets/src/pages/login.dart';
import 'package:markets/src/repository/user_repository.dart';

class Prelogin2 extends StatefulWidget {
  @override
  _Prelogin2State createState() => _Prelogin2State();
}

class _Prelogin2State extends State<Prelogin2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIflOgin();
  }

  @override
  Widget build(BuildContext context) {
    //var width2 = 80;
    return Scaffold(
        body: Container(
      width: 480,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/bg_noodle.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Container(child: Image.asset('assets/images/BG.png')),
          Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/takelogo/take_logo03.png'))),
              )),
          Text(
            "Discover the best foods from over 2,000 restaurants",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),

          ///Log in button
          Padding(padding: EdgeInsets.only(top: 180)),
          Container(
            width: 280,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Login');
                //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWidget()));
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Text("Log In"),
              color: Colors.white,
            ),
          ),

          ///Connect with facebook
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            width: 280,
            height: 50,
            child: RaisedButton.icon(
              onPressed: () {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/img/facebook.png')),
                ),
              ),
              label: Text('Connect with facebook'),
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),

//connect with google
          Container(
            width: 280,
            height: 50,
            child: RaisedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWidget()));
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/img/google.png')),
                ),
              ),
              label: Text('Connect with google'),
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),

          ///SignUp
          Container(
            width: 280,
            height: 50,
            child: OutlineButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/Register');
              },
              borderSide: BorderSide(
                color: Colors.white, //Color of the border
                style: BorderStyle.solid, //Style of the border
                width: 0.8, //width of the border
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              icon: Container(
                height: 0,
                width: 0,
              ),
              label: Text(
                'Sign up with Email',
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),

          Container(
            width: 300,
            child: Text(
              "By signing up you agree to our Terms of Use and Privacy Policy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }

  void checkIflOgin() {
    currentUser.value.apiToken != null ? print("ok") : print("please login");
  }
}
