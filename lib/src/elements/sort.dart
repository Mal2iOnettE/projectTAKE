import 'package:flutter/material.dart';
import 'package:markets/generated/l10n.dart';

class Sort extends StatefulWidget {
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
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
        Padding(
          padding: EdgeInsets.only(top: 40),
        ),
        CheckboxListTile(
          title: Text("Recommended"),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
        ),
        Divider(
          color: Colors.grey[203],
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
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
        Divider(
          color: Colors.grey[203],
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
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
        Divider(
          color: Colors.grey[203],
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
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
        Divider(
          color: Colors.grey[203],
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: EdgeInsets.only(top: 200),
        ),
        //SizedBox(height: 30),

        Container(
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          height: 50.0,
          width: 330.0,
          child: FlatButton(
            color: Colors.pink,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              /*...*/
            },
            child: Text(
              "DONE",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        )
      ],
    );
  }
}
