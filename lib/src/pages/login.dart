//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../generated/l10n.dart';
import '../controllers/user_controller.dart';
import '../helpers/app_config.dart' as config;
import '../helpers/helper.dart';
import '../repository/user_repository.dart' as userRepo;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends StateMVC<LoginWidget> {
  UserController _con;

  _LoginWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
    if (userRepo.currentUser.value.apiToken != null) {
      Navigator.of(context).pushReplacementNamed('/Pages', arguments: 0);
    } else {
      Fluttertoast.showToast(msg: "Wrong Username or Password", fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img/BG-1.png'))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              Container(
                width: config.App(context).appWidth(84),
                height: config.App(context).appHeight(10),
                child: Text(
                  S.of(context).login_,
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
                    ///Email
                    Padding(
                      padding: EdgeInsets.only(right: 27.0, left: 27.0),
                      child: TextFormField(
                        //cursorColor: Colors.black,

                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => _con.user.email = input,
                        validator: (input) => !input.contains('@') ? S.of(context).use_valid_email : null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: S.of(context).enter_email,
                          labelStyle: TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'johndoe@gmail.com',
                          hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                          //prefixIcon: Icon(Icons.alternate_email, color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    ///Password
                    Padding(
                      padding: EdgeInsets.only(right: 27.0, left: 27.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => _con.user.password = input,
                        validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                        obscureText: _con.hidePassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: S.of(context).enter_password,
                          labelStyle: TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: '••••••••••••',
                          hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                          //prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).accentColor),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _con.hidePassword = !_con.hidePassword;
                              });
                            },
                            color: Theme.of(context).focusColor,
                            icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),

                    //Login
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                            padding: EdgeInsets.all(12),
                            child: Text(
                              S.of(context).login,
                              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
                            ),
                            color: Theme.of(context).accentColor,
                            onPressed: () {
                              _con.login();
                            }),
                      ),
                    ),

                    SizedBox(height: 15),

                    //skip
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/Pages', arguments: 0);
                      },
                      shape: StadiumBorder(),
                      textColor: Theme.of(context).hintColor,
                      child: Text(S.of(context).skip),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    ),
//                      SizedBox(height: 10),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  //forgot password
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/ForgetPassword');
                    },
                    textColor: Theme.of(context).hintColor,
                    child: Text(
                      S.of(context).forgot_password,
                      style: TextStyle(fontSize: 17.0, color: Theme.of(context).accentColor),
                    ),
                  ),

                  //Don't have account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(S.of(context).dont_have_account),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Register'); //Signup2()
                        },
                        textColor: Theme.of(context).hintColor,
                        child: Text(S.of(context).signup),
                      ),
                    ],
                  ),

                  //term and policy
                  Text(
                    "By signing up you agree to our Terms of Use and Privacy Policy",
                    style: TextStyle(color: Colors.black38, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                  Container(height: 200.0, child: Image.asset('assets/img/sub_bg01.png'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
