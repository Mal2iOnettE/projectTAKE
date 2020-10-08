import 'package:flutter/material.dart';
import 'package:markets/generated/l10n.dart';
import 'package:markets/src/pages/TAKE01.dart';
import 'package:markets/src/pages/TAKE02.dart';

class SelectionPages extends StatefulWidget {
  @override
  _SelectionPagesState createState() => _SelectionPagesState();
}

class _SelectionPagesState extends State<SelectionPages> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TAKE01PAGE()));
          },
          child: Container(
            height: 109.0,
            width: 200.0,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0, left: 15.0),
                child: Text(
                  S.of(context).take_branch_suwintawong,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/Marketplace");
          },
          child: Container(
            height: 109.0,
            width: 200.0,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0, left: 15.0),
                child: Text(
                  S.of(context).take_maketplace,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
