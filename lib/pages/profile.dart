import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Profile",
      style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
    ));
  }
}
