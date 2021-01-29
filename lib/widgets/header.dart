import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = false, titleText = ""}) {
  return AppBar(
    title: Text(
      isAppTitle ? "Social App" : titleText,
      style: TextStyle(
        fontSize: isAppTitle ? 50 : 22,
        fontFamily: isAppTitle ? "Signatra" : "",
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
