import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../generated/l10n.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;

class MobileVerification2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _ac = config.App(context);
    return Scaffold(
      
        //resizeToAvoidBottomPadding: false,
         body: Center(
          child: Container(
            width: 400.0,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img/BG-1.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 110,
                ),
      Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: _ac.appWidth(100),
              child: Column(
                children: <Widget>[
                  Text(
                    'Verification',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'We’ve sent a verification code to',
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
            SizedBox(height: 15),
            Text(
              'SMS has been sent to +155 4585 555',
              style: Theme.of(context).textTheme.bodyText2,
              
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
                ],
              ),
            ),
            
            OTPTextField(
              length:4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 50,
              fieldStyle: FieldStyle.underline,
              style: TextStyle(fontSize: 17),
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            /*TextField(
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
              decoration: new InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2)),
                ),
                focusedBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(
                    color: Theme.of(context).focusColor.withOpacity(0.5),
                  ),
                ),
                hintText: '000-000',
              ),
            ),*/
            SizedBox(height: 40),
  

             Padding(
               padding: const EdgeInsets.only(left: 5.0,right: 5.0),
               child: Container(
                 height: 55,
                 child: RaisedButton(
                   shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/Pages', arguments:0);
                  },
                  color: Theme.of(context).accentColor,
                  child: Text(S.of(context).verify.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor))),
            ),
               ),
             ),
          ],
        ),
      ),
   
               ],),),), );
  }
}
