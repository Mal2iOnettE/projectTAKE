import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markets/src/elements/Cuisines.dart';
import 'package:markets/src/elements/Dietarysort.dart';
import 'package:markets/src/elements/sort.dart';
import 'package:selectable_circle_list/selectable_circle_item.dart';
import 'package:selectable_circle_list/selectable_circle_list.dart';
import '../../generated/l10n.dart';
import '../models/filter.dart';
import '../controllers/filter_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:chips_choice/chips_choice.dart';

class Filterpage extends StatefulWidget {
  @override
  _FilterpagState createState() => _FilterpagState();
}

class _FilterpagState extends State<Filterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView(
            primary: true,
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          'Price range',
                          style: TextStyle(fontSize: 23.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SelectableCircleList(
                  children: _buildItems(),
                  subDescription: Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  onTap: _onTapCircle,
                  //initialValue: "4|subsecond",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Text(
                  'Dietary',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Dietary(),

              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Text(
                  'Cuisines',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              Cuisines()

              //FlatButton(onPressed: () {}),
            ],
          ),
        )
      ],
    ));
  }

  List<SelectableCircleItem> _buildItems() {
    return <SelectableCircleItem>[
      SelectableCircleItem(
        Text("100"),
        "",
        "100",
        Colors.pink,
      ),
      SelectableCircleItem(
        Text("300"),
        "",
        "300",
        Colors.pink,
      ),
      SelectableCircleItem(
        Text("500"),
        "",
        "500",
        Colors.pink,
      ),
      SelectableCircleItem(
        Text("1000"),
        "",
        "1000",
        Colors.pink,
      ),
    ];
  }

  _onTapCircle(String value, String subvalue) {
    print("tapped $value $subvalue");
  }

  _onTapMulti(List<String> values) {
    print(values);
  }
}
