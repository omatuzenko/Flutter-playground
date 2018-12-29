import 'package:flutter/material.dart';

import 'package:flutter_app/ui_utils.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Activity'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.group),
            title: new Text('Groups'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text('More')
          )
        ],
      ),
    );
  }
}