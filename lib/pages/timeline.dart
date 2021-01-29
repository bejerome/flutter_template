import 'package:flutter/material.dart';
import 'package:socialtutorial/widgets/header.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Center(
        child: Text(
          "Timeline",
          style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
        ),
      ),
    );
  }
}
