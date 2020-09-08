import 'package:flutter/material.dart';
import 'package:markets/src/controllers/controller.dart';
import 'package:markets/src/controllers/home_controller.dart';
import 'package:markets/src/elements/ListMarket.dart';
import 'package:markets/src/models/market.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AllRestaurant extends StatefulWidget {
  List<Market> marketlist;
  AllRestaurant({Key key, this.marketlist}) : super(key: key);
  @override
  _AllRestaurantState createState() => _AllRestaurantState();
}

class _AllRestaurantState extends StateMVC<AllRestaurant> {
  HomeController _con;

  _AllRestaurantState() : super(HomeController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.0),
          child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/wallet.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 26.0,
                      ),
                    )),
              ]),
        ),
        body: ListMarkets(
          marketList: _con.topMarkets,
          heroTag: 'home_top_markets',
        ) /*ListView(
        children: <Widget>[
          SizedBox(
            height: 20.0,
            //width: 200.0,
          ),
          ListTile(
            leading: Container(
                width: 80.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/img/coffee.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
            title: Text(
              'Good Day Cafe',
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontSize: 15.0,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cafe, Western Food, Western',
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 15.0,
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      height: 30.0,
                      //width: 200.0,
                    ),
                    Text(
                      '4.9  (210 ratings)',
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 12.0,
                        color: Colors.grey,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //selected: true,
            trailing: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          ),
          SizedBox(
            height: 50.0,
            width: 200.0,
            child: Divider(
              color: Colors.grey.shade800,
              indent: 20,
              endIndent: 20,
            ),
          ),
          ListTile(
            leading: Container(
                width: 80.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/img/cheese_lovers.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
            title: Text(
              'Cheese Lovers',
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontSize: 15.0,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cafe, Western Food, Western',
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 15.0,
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      height: 10.0,
                      //width: 200.0,
                    ),
                    Text(
                      '4.9  (210 ratings)',
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 12.0,
                        color: Colors.grey,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //selected: true,
            trailing: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 50.0,
            width: 200.0,
            child: Divider(
              color: Colors.grey.shade800,
              indent: 20,
              endIndent: 20,
            ),
          ),
          ListTile(
            leading: Container(
                width: 80.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/img/MilkTea.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            title: Text(
              'Cool MilkTea Forever',
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontSize: 15.0,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cafe, Western Food, Western',
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 15.0,
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      height: 10.0,
                      //width: 200.0,
                    ),
                    Text(
                      '4.9  (210 ratings)',
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 12.0,
                        color: Colors.grey,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //selected: true,
            trailing: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 50.0,
            width: 200.0,
            child: Divider(
              color: Colors.grey.shade600,
              indent: 20,
              endIndent: 20,
            ),
          ),
        ],
      ),*/
        );
  }
}
