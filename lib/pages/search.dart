import 'package:flutter/material.dart';
import 'package:socialtutorial/widgets/header.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Search"),
        body: Center(
          child: Text(
            'Search',
            style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
          ),
        ));
  }
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Search"),
        body: Center(
          child: Text(
            'Activity Feed Item',
            style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
          ),
        ));
  }
}
