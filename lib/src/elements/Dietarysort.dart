import 'package:flutter/material.dart';
import 'package:markets/src/controllers/FilterController.dart';
import '../models/filter.dart';
import 'package:flutter/widgets.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import '../../generated/l10n.dart';
import '../controllers/filter_controller.dart';

class Dietary extends StatefulWidget {
   final ValueChanged<Filter> onFilter;
 Dietary({Key key, this.onFilter}) : super(key: key);

@override
  _DietaryState createState() => _DietaryState();
}



class _DietaryState extends StateMVC<Dietary> {
  DietaryController _con;
   _DietaryState() : super(DietaryController()) {
    _con = controller;
  }
  
   @override
  Widget build(BuildContext context) {
    return  MyStatefulWidget();
  
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: ListView(
           primary: true,
                shrinkWrap: true,
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              }, 
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _vegetarian = false;
  bool  _vegan = false;
  bool _gluten = false;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           CheckboxListTile(
           title: Text("Vegetarian"),
            value: _vegetarian ?? false,
            onChanged: (bool newvalue) {
            setState(() {
              _vegetarian = newvalue;
            });
          },
         ),
         CheckboxListTile(
           title: Text("Vegan"),
            value: _vegan ?? false,
            onChanged: (bool newValue) {
            setState(() {
              _vegan = newValue;
            });
          },
         ),
         CheckboxListTile(
           title: Text("Gluten-free"),
            value: _gluten ?? false,
            onChanged: (bool newValue) {
            setState(() {
              _gluten = newValue;
            });
          },
         ),
      ],
    );
 
    
  }

}