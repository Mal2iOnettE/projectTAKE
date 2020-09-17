import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markets/src/controllers/FilterController.dart';
import 'package:markets/src/elements/CircularLoadingWidget.dart';
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/filter_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../models/filter.dart';

class FilterWidget extends StatefulWidget {
  final ValueChanged<Filter> onFilter;

  FilterWidget({Key key, this.onFilter}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends StateMVC<FilterWidget> {
  FilterController _con;

  _FilterWidgetState() : super(FilterController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        title: Text("Filter & Sort"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(S.of(context).filter),
                  MaterialButton(
                    onPressed: () {
                      _con.clearFilter();
                    },
                    child: Text(
                      S.of(context).clear,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
                  ExpansionTile(
                    title: Text(S.of(context).delivery_or_pickup),
                    children: [
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: _con.filter?.delivery ?? false,
                        onChanged: (value) {
                          setState(() {
                            _con.filter?.delivery = true;
                          });
                        },
                        title: Text(
                          S.of(context).delivery,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: _con.filter?.delivery ?? false ? false : true,
                        onChanged: (value) {
                          setState(() {
                            _con.filter?.delivery = false;
                          });
                        },
                        title: Text(
                          S.of(context).pickup,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                    ],
                    initiallyExpanded: true,
                  ),
                  ExpansionTile(
                    title: Text(S.of(context).opened_markets),
                    children: [
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: _con.filter?.open ?? false,
                        onChanged: (value) {
                          setState(() {
                            _con.filter?.open = value;
                          });
                        },
                        title: Text(
                          S.of(context).open,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                    ],
                    initiallyExpanded: true,
                  ),
                  _con.fields.isEmpty
                      ? CircularLoadingWidget(height: 100)
                      : ExpansionTile(
                          title: Text(S.of(context).fields),
                          children: List.generate(_con.fields.length, (index) {
                            return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: _con.fields.elementAt(index).selected,
                              onChanged: (value) {
                                _con.onChangeFieldsFilter(index);
                              },
                              title: Text(
                                _con.fields.elementAt(index).name,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                maxLines: 1,
                              ),
                            );
                          }),
                          initiallyExpanded: true,
                        ),
                ],
              ),
            ),
            SizedBox(height: 15),

            
            FlatButton(
              onPressed: () {
                _con.saveFilter().whenComplete(() {
                  widget.onFilter(_con.filter);
                });
              },
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Theme.of(context).accentColor,
              shape: StadiumBorder(),
              child: Text(
                S.of(context).apply_filters,
                textAlign: TextAlign.start,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}

// 1 appbar
// 2 selectabel_circle
// 3
// 4 filter
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//       home: DefaultTabController(
//           length: 2,
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               bottom: TabBar(
//                 labelColor: Colors.pink, //Google's sweet blue
//                 unselectedLabelColor: Color(0xff5f6368),
//                 indicatorColor: Colors.pink,
//                 tabs: [
//                   Tab(
//                     text: 'Filter',
//                   ),
//                   Tab(
//                     text: 'Sort',
//                   )
//                 ],
//               ),
//               title: Text('Tabs Demo'),
//             ),
//             body: TabBarView(
//               children: [
//                 // Text ( S.of(context).pricerange,style: TextStyle(fontSize: 20.0) ,),
//                 Filterpage(),
//                 Sort(),
//                 //Icon(Icons.directions_bike),
//               ],
//             ),
//           )));
// }
