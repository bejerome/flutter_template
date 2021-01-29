import 'package:flutter/material.dart';
import 'package:socialtutorial/widgets/header.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Profile"),
      body: Center(
          child: Text(
        "Profile",
        style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
      )),
    );
  }
}
