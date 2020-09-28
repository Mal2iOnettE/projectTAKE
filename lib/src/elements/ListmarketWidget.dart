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
      // child: ListTile(
      //   title: Text(listmarket.name),
      //   trailing: Icon(Icons.favorite_border),
      //   leading: Container(
      //     height: 50,
      //     width: 50,
      //     decoration: BoxDecoration(
      //         image:
      //             DecorationImage(image: NetworkImage(listmarket.image.url))),
      //   ),
      // ),
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
                    image: DecorationImage(
                      image: new NetworkImage(listmarket.image.url),
                      fit: BoxFit.fill,
                    ),
                  )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Text(listmarket.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(listmarket.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
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
