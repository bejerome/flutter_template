import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialtutorial/widgets/components.dart';
import 'package:socialtutorial/widgets/header.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<DocumentSnapshot> getUserInfo() async {
    return await usersRef.doc('113847347114787469946').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Profile"),
      body: Center(
        child: GetUserName('113847347114787469946'),
      ),
    );
  }
}
