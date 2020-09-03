import 'package:flutter/material.dart';
import 'package:markets/generated/l10n.dart';
import 'package:markets/generated/l10n.dart';
import 'package:markets/generated/l10n.dart';
import 'package:markets/src/controllers/profile_controller.dart';
import 'package:markets/src/pages/login.dart';
import 'package:markets/src/repository/user_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends StateMVC<OtherPage> {
  _OtherPageState() : super(ProfileController()) {
    //_con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      GestureDetector(
        onTap: () {
          currentUser.value.apiToken != null ? Navigator.of(context).pushNamed('/Profile') : Navigator.of(context).pushNamed('/Login');
        },
        child: currentUser.value.apiToken != null
            ? UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withOpacity(0.1),
                ),
                accountName: Text(
                  currentUser.value.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                accountEmail: Text(
                  currentUser.value.email,
                  style: Theme.of(context).textTheme.caption,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  backgroundImage: NetworkImage(currentUser.value.image.thumb),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withOpacity(0.1),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30.0,
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                    ),
                    /*Icon(
                          Icons.person,
                          size: 32,
                          color: Theme.of(context).accentColor.withOpacity(1),
                        ),*/
                    SizedBox(width: 30),
                    Text(
                      S.of(context).guest,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
      ),

      ///Setting
      ListTile(
        onTap: () {
          if (currentUser.value.apiToken != null) {
            Navigator.of(context).pushNamed('/Settings');
          } else {
            Navigator.of(context).pushReplacementNamed('/Login');
          }
        },
        leading: Icon(
          Icons.settings,
          color: Theme.of(context).focusColor.withOpacity(1),
        ),
        title: Text(
          S.of(context).settings,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),

      ///Change Languages
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/Languages');
        },
        leading: Icon(
          Icons.translate,
          color: Theme.of(context).focusColor.withOpacity(1),
        ),
        title: Text(
          S.of(context).languages,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),

      //Logout
      ListTile(
        onTap: () {
          if (currentUser.value.apiToken != null) {
            logout().then((value) {
              Navigator.of(context).pushNamedAndRemoveUntil('/Pages', (Route<dynamic> route) => false, arguments: 0);
            });
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginWidget()));
          }
        },
        trailing: Icon(Icons.arrow_right),
        leading: Icon(
          Icons.exit_to_app,
          color: Theme.of(context).focusColor.withOpacity(1),
        ),
        title: Text(
          currentUser.value.apiToken != null ? S.of(context).log_out : S.of(context).login,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    ]);
  }
}
