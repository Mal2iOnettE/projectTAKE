import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
//import 'package:async/async.dart';
//import 'cuisines.dart';
//import 'package:chips_choice/chips_choice.dart';

class Cuisines extends StatefulWidget {
  @override
  _CuisinesState createState() => _CuisinesState();
}

class _CuisinesState extends State<Cuisines> {
  int tag = 1;
  List<String> tags = [];

  List<String> options = [
    'All',
    'American',
    'Asian',
    'Dessert',
    'Italian',
    'Greek',
    'Japanese',
    'Mexican',
    'Pizza',
    'Thai',
  ];

  String user;
  //final usersMemoizer = AsyncMemoizer<List<ChipsChoiceOption<String>>>();

  Color values = Colors.black38;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          Content(
            title: "", //'Works with FormField and Validator',
            child: FormField<List<String>>(
              autovalidate: true,
              initialValue: tags,
              builder: (state) {
                return Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ChipsChoice<String>.multiple(
                        value: state.value,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: options,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        onChanged: (val) => state.didChange(val),
                        itemConfig: ChipsChoiceItemConfig(
                            selectedColor: Colors.pink,
                            unselectedBrightness: Brightness.light,
                            selectedBrightness: Brightness.dark,
                            unselectedColor: Colors.black,
                            unselectedBorderOpacity: 0,
                            selectedBorderOpacity: 0,
                            showCheckmark: false,
                            labelStyle: const TextStyle(color: Colors.red)),
                        isWrapped: true,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Function(bool selected) onSelect;

  CustomChip(this.label, this.selected, this.onSelect, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 100,
      width: 70,
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      child: InkWell(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 9,
              right: 9,
              bottom: 9,
              child: Container(
                child: Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected ? Colors.black26 : Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String title;
  final Widget child;

  Content({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            //color: Colors.blueGrey[50],
            child: Text(
              title,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500
              ),
            ),
          ),*/
        child,
      ],
    );
  }
}

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cuisines2 extends StatefulWidget {
  @override
  _Cuisines2State createState() => _Cuisines2State();
}

class _Cuisines2State extends State<Cuisines2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _titleContainer("Choose Cuisines"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                spacing: 5.0,
                runSpacing: 3.0,
                children: <Widget>[
                  filterChipWidget(chipName: 'All'),
                  filterChipWidget(chipName: 'American'),
                  filterChipWidget(chipName: 'Asian'),
                  filterChipWidget(chipName: 'Dessert'),
                  filterChipWidget(chipName: 'Italian'),
                  filterChipWidget(chipName: 'Greek'),
                  filterChipWidget(chipName: 'Japanese'),
                  filterChipWidget(chipName: 'Mexican'),
                  filterChipWidget(chipName: 'Pizza'),
                  filterChipWidget(chipName: 'Thai'),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
  );
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
          color: Color(0xff6200ee),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color(0xffeadffd),
    );
  }
}
