import 'package:flutter/material.dart';

class ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Activity Feed',
      style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
    ));
  }
}

class ActivityFeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Activity Feed Item',
        style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
      ),
    );
  }
}
