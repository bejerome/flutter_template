import 'package:flutter/material.dart';
import 'package:socialtutorial/widgets/header.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Upload"),
        body: Center(
          child: Text(
            'photos',
            style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
          ),
        ));
  }
}
