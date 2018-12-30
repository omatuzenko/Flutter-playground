import 'package:flutter/material.dart';
import 'package:flutter_app/ui_utils.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class NotificationsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIConst.backgroundContentColor,
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: Center(
          child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
              new Image.asset('images/notifications.png'),
            ],
          )
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