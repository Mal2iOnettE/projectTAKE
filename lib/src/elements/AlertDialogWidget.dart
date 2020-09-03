import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PopupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,width: 150.0,
      child: _onAlert(context),
    );
  }

  _onAlert(context) {
    Alert(
      context: context,
      title: "Alert",
      desc: "ssssss",
    ).show();
  }
}
