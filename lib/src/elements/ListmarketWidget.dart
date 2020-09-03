import 'package:flutter/material.dart';
import 'package:markets/src/models/market.dart';

class ListTileMarket extends StatelessWidget {
  Market listmarket;
  String herotag;
  ListTileMarket({Key key, this.listmarket, this.herotag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, width: 300.0,
      child: ListTile(
        title: Text(listmarket.name),
        trailing: Icon(Icons.ac_unit),
        leading: Container(
          height: 50,width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(listmarket.image.url)
            )
          ),
        ),
      ),
    );
  }
}
