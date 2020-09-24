import 'package:flutter/material.dart';

class TAKE01PAGE extends StatefulWidget {
  @override
  _TAKE01PAGEState createState() => _TAKE01PAGEState();
}

class _TAKE01PAGEState extends State<TAKE01PAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TAKE--001"),
      ),
      body: Text("This is  TAKE001"),
    );
  }
}