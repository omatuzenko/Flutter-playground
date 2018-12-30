import 'package:flutter/material.dart';
import 'package:flutter_app/ui_utils.dart';

class NotificationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ffffff"),
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
          child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          new Image.asset('images/notifications.png'),
        ],
      )),
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
        image: new DecorationImage(
            image: new AssetImage("assets/notifications.png")),
      ),
    );
  }
}
