import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialtutorial/utilities/firestore_class.dart';
import 'package:socialtutorial/widgets/components.dart';
import 'package:socialtutorial/widgets/header.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  // Set default `_initialized` and `_error` state to false
  bool initialized = false;
  bool error = false;
  FireStoreDatabase dB = new FireStoreDatabase();
  @override
  void initState() {
    super.initState();
  }

// Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: AddUser(fullName: 'Jane', company: 'Brain', age: 30),
    );
  }
}
