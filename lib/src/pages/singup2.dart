import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../helpers/helper.dart';
import 'mobile_verification_2.dart';

class SignUpWidget2 extends StatefulWidget {
  @override
  _SignUpWidget2State createState() => _SignUpWidget2State();
}

class _SignUpWidget2State extends StateMVC<SignUpWidget2> {
  UserController _con;

  _SignUpWidget2State() : super(UserController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        //resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/BG-1.png'),
                fit: BoxFit.cover
                )
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 110,
                ),
                Container(
                  width: config.App(context).appWidth(84),
                  height: config.App(context).appHeight(10),
                  child: Text(
                    S.of(context).create_your_account,
                    style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Colors.black)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: _con.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /*  TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => _con.user.name = input,
                        validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_letters : null,
                        decoration: InputDecoration(
                          labelText: S.of(context).full_name,
                          labelStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.all(12),
                          hintText: S.of(context).john_doe,
                          hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                          prefixIcon: Icon(Icons.person_outline, color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        ),
                      ),*/
                      //SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(right: 27, left: 27),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => _con.user.email = input,
                          validator: (input) => !input.contains('@') ? S.of(context).use_valid_email : null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            labelText: S.of(context).email,
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.all(18),
                            hintText: 'johndoe@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      Padding(
                        padding: EdgeInsets.only(right: 27, left: 27),
                        child: TextFormField(
                          obscureText: _con.hidePassword,
                          onSaved: (input) => _con.user.password = input,
                          validator: (input) => input.length < 6 ? S.of(context).should_be_more_than_6_letters : null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            labelText: S.of(context).password,
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.all(18),
                            hintText: '••••••••••••',
                            hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _con.hidePassword = !_con.hidePassword;
                                });
                              },
                              color: Colors.grey,
                              icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      Padding(
                        padding: EdgeInsets.only(right: 27, left: 27),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onSaved: (input) => _con.user.email = input,
                          validator: (input) => !input.contains('@') ? S.of(context).use_valid_email : null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            labelText: S.of(context).phone,
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.all(18),
                            hintText: 'Phonenumber',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),

                    // Next Button
                  
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Container(
                          height: 55,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              S.of(context).next,
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                            color: Theme.of(context).accentColor,
                            onPressed: () {
                              _con.register();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MobileVerification2()));
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      Center(
                        child: Text('By signing up you agree to our Terms of Use and Privacy Policy',
                             style: Theme.of(context).textTheme.caption)
                        ),

//                      FlatButton(
//                        onPressed: () {
//                          Navigator.of(context).pushNamed('/MobileVerification');
//                        },
//                        padding: EdgeInsets.symmetric(vertical: 14),
//                        color: Theme.of(context).accentColor.withOpacity(0.1),
//                        shape: StadiumBorder(),
//                        child: Text(
//                          'Register with Google',
//                          textAlign: TextAlign.start,
//                          style: TextStyle(
//                            color: Theme.of(context).accentColor,
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),

                //),

                SizedBox(
                  height: 50,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Login');
                  },
                  textColor: Theme.of(context).hintColor,
                  child: Text(S.of(context).i_have_account_back_to_login),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
