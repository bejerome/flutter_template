import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:socialtutorial/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.teal,
      ),
      title: 'SociaApp',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
