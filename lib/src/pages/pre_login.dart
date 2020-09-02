import 'package:flutter/material.dart';

import 'login.dart';
import 'singup2.dart';

class Prelogin extends StatefulWidget {
  @override
  _PreloginState createState() => _PreloginState();
}

class _PreloginState extends State<Prelogin> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBG();
  }

  void loadBG() {
     Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/final-project-version-2.appspot.com/o/picture%2FBG.png?alt=media&token=b629fd78-4648-4adb-a6c5-4487e039fb10'),
                fit: BoxFit.cover
                )
                )
            );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 450.0),
          child: RaisedButton(
            onPressed: () {
              //Navigator.of(context).pushReplacementNamed('/Login');
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginWidget()));
            },
            color: Colors.red,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpWidget2()),
            );
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpWidget()));
          },
          color: Colors.red,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/Register');
          },
          color: Colors.red,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            'Login with Facebook',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
