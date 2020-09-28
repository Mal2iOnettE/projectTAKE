import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/checkout_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../helpers/helper.dart';
import '../models/payment.dart';
import '../models/route_argument.dart';

class Trackorders extends StatefulWidget {
  @override
  _TrackordersState createState() => _TrackordersState();
}

class _TrackordersState extends State<Trackorders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'assets/img/Track_order.png',
      height: 1200,
      width: 500,
      fit: BoxFit.fitWidth,
    ));
  }
}
