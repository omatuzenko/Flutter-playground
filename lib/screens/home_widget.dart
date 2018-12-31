import 'package:flutter/material.dart';
import 'package:flutter_app/screens/actvity_stub_widget.dart';
import 'package:flutter_app/screens/groups_widget.dart';
import 'package:flutter_app/screens/messages_widget.dart';
import 'package:flutter_app/screens/more_widget.dart';
import 'package:flutter_app/screens/notifications_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ActivityStubWidget(),
    GroupsWidget(),
    MessagesWidget(),
    NotificationsWidget(),
    MoreWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
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
              icon: new Stack(
                  children: <Widget>[
                    new Icon(Icons.notifications),
                    new Positioned( // draw a red marble
                      top: -1.0,
                      right: -1.0,
                      child: new Icon(Icons.brightness_1, size: 10.0,
                          color: Colors.redAccent),
                    )
                  ]
              ),
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}