import 'package:flutter/material.dart';
import 'package:markets/src/models/market.dart';

class ListTileMarket extends StatelessWidget {
  Market listmarket;
  String herotag;
  ListTileMarket({Key key, this.listmarket, this.herotag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 10.0)),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: new NetworkImage(listmarket.image.url),
                      fit: BoxFit.fill,
                    ),
                  )),
              Container(
                width: 250.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 0.0),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listmarket.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(height: 8.0,),
                          Text(
                            listmarket.description,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(height: 8.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star,color: Theme.of(context).accentColor,),
                              Text("  ${listmarket.rate.toString()} ( ${listmarket.rate.length.toString()} ratings ) ")
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.favorite_border, color: Theme.of(context).accentColor,)
            
            ],
          ),
          SizedBox(
            width: 200.0,
            height: 20.0,
          ),
          Divider(
            color: Colors.grey[200],
            height: 10,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
