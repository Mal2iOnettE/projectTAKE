import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markets/src/controllers/FilterController.dart';
import 'package:markets/src/elements/filterpage.dart';
import 'package:markets/src/elements/sort.dart';
import 'package:markets/src/models/review.dart';
import 'package:markets/src/pages/home.dart';
import 'package:markets/src/pages/login.dart';
import 'package:markets/src/pages/singup2.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/filter_controller.dart';
import '../models/filter.dart';







class FilterWidget extends StatefulWidget {
  final ValueChanged<Filter> onFilter;

  FilterWidget({Key key, this.onFilter}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends StateMVC<FilterWidget> {
  DietaryController _con;

  _FilterWidgetState() : super(DietaryController()) {
    _con = controller;

    
  }


// 1 appbar
// 2 selectabel_circle
// 3 
// 4 filter
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child:  Scaffold(
          appBar:AppBar(
               backgroundColor: Colors.white,
              bottom: TabBar(
                
                labelColor: Colors.pink, //Google's sweet blue
                unselectedLabelColor: Color(0xff5f6368),
                indicatorColor: Colors.pink,
                tabs: [
                  Tab(text: 'Filter',),
                  Tab(text: 'Sort',)
                  
                ],
              ),
              title: Text('Tabs Demo'),
            ),
        

        body:   TabBarView(
            children: [
            // Text ( S.of(context).pricerange,style: TextStyle(fontSize: 20.0) ,),
             Filterpage(),
             Sort(),
              //Icon(Icons.directions_bike),
            ],
          ),
       
          
        ))
      );
   
  

  }
}
