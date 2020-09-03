import 'package:flutter/material.dart';
import 'package:markets/generated/l10n.dart';
import 'package:markets/generated/l10n.dart';
import 'package:markets/generated/l10n.dart';
import 'package:markets/src/controllers/profile_controller.dart';
import 'package:markets/src/elements/ProfileAvatarWidget.dart';
import 'package:markets/src/pages/profile.dart';
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
<<<<<<< HEAD
    return ListView(
        children: <Widget>[
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
                      textAlign:TextAlign.center
                    ),
                    accountEmail: Text(
                      currentUser.value.email,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: NetworkImage(currentUser.value.image.thumb),
=======
    return ListView(children: <Widget>[
      GestureDetector(
        onTap: () {
          currentUser.value.apiToken != null ? Navigator.of(context).pushNamed('/Profile') : Navigator.of(context).pushNamed('/Login');
        },
        child: currentUser.value.apiToken != null
            ? Column(
                children: [
                  ProfileAvatarWidget(
                    user: currentUser.value,
                  ),
                ],
              )

            /*UserAccountsDrawerHeader(
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
              )*/
            : Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withOpacity(0.1),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30.0,
>>>>>>> be1692daf5c39e5c5ac5cdcb969dc7cbc09cd10d
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

      //Profile
      ListTile(
        onTap: () {
          // Navigator.of(context).pushNamed('/Profile');
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileWidget()));
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).profile,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      //Favorites
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/favorites');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).favorites,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      //Payments
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/PaymentMethod');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).payment,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      //Orderhistory
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/orders');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).order_history,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      //Deliveryaddress
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/DeliveryAddresses');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).delivery_addresses,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      //openstore
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/Languages');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).open_store,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      ///Setting
      ListTile(
        onTap: () {
          if (currentUser.value.apiToken != null) {
            Navigator.of(context).pushNamed('/Settings');
          } else {
            Navigator.of(context).pushReplacementNamed('/Login');
          }
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).settings,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      ///Change Languages
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/Languages');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).languages,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      //about
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/Languages');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).aboutus,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      divider(),

      //Support center
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/Languages');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).support_center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),

      divider(),

      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/Logout');
        },
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          S.of(context).log_out,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    ]);
  }

  Widget divider() {
    return Divider(
      indent: 20,
      endIndent: 20,
      height: 25,
      color: Colors.black26,
    );
  }
}
