import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class NotificationsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: Center(
          child: Image.asset(
              'backgrounds/notifications.png', scale: 3.0, width: 48.0, height: 48.0
          ),
        ),
    );
  }

}

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
      child: new Center(child: new Text("My Image")),
      position: DecorationPosition.background,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: null,
        image: new DecorationImage(image: new AssetImage("assets/notifications.png")),
      ),
    );
  }
}