import 'package:flutter/material.dart';
import 'package:markets/src/elements/SearchBarWidget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../generated/l10n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../helpers/helper.dart';

class ForgetPasswordWidget extends StatefulWidget {
  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends StateMVC<ForgetPasswordWidget> {
  UserController _con;

  _ForgetPasswordWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img/BG-1.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
            ),
            Container(
              width: config.App(context).appWidth(50),
              height: config.App(context).appHeight(10),
              child: Center(
                child: Text(
                  S.of(context).email_reset_password,
                  style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Colors.black)),
                ),
              ),
            ),

            //padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
            //width: config.App(context).appWidth(88),
            // height: config.App(context).appHeight(55),
            Form(
              key: _con.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 110,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: 50.0,
                    child: Text(
                      "Please enter your email to receive the instruction to reset your password",
                      style: TextStyle(color: Colors.black38, fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 27.0, left: 27.0, top: 20.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                          padding: EdgeInsets.all(12),
                          child: Text(
                            S.of(context).send_password_reset,
                            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15.0),
                          ),
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            _con.resetPassword();
                            Alert(context: context, title: "resetpassword has been send to your email", buttons: [
                              DialogButton(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () =>Navigator.of(context).pop())
                            ]).show();
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
