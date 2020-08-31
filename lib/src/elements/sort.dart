
import 'package:flutter/material.dart';
import 'package:markets/generated/l10n.dart';



class Sort extends StatefulWidget {
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  
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
        child: Row(
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
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       CheckboxListTile(
           title: Text("Recommended"),
            value: _isSelected,
            onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
         ),
      CheckboxListTile(
           title: Text("Most popular"),
            value: _isSelected,
            onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
         ),
     CheckboxListTile(
           title: Text("Rating"),
            value: _isSelected,
            onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
         ),
      CheckboxListTile(
           title: Text("Delivery time"),
            value: _isSelected,
            onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
         ),
         
      ],
    );
 
    
  }

}