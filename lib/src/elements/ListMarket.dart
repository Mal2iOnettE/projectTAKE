import 'package:flutter/material.dart';
import 'package:markets/src/elements/CardWidget.dart';
import 'package:markets/src/elements/ListmarketWidget.dart';
import 'package:markets/src/models/market.dart';
import 'package:markets/src/models/route_argument.dart';

class ListMarkets extends StatefulWidget {
 
  List<Market> marketList;
  String heroTag;
  ListMarkets({Key key, this.marketList, this.heroTag}) : super(key: key);
  
  @override
  _ListMarketsState createState() => _ListMarketsState();
}

class _ListMarketsState extends State<ListMarkets> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return widget.marketList.isEmpty
        ? Text("Empty")
        : Container(
            height: 200,
            child: 
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.marketList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Details',
                        arguments: RouteArgument(
                          id: widget.marketList.elementAt(index).id,
                          heroTag: widget.heroTag,
                        ));
                  },
                  child: 
                  ListTileMarket(
                    listmarket:widget.marketList.elementAt(index),
                    herotag:widget.heroTag
                  )

                  /*CardWidget(
                    market: widget.marketList.elementAt(index), 
                    heroTag: widget.heroTag
                    ),*/

                );
              },
            ),
          );
  }
}
