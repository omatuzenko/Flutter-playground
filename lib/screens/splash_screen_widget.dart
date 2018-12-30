import 'dart:async';

import 'package:flutter_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: UIConst.primaryColor,
      body: new Center(
        child: new Image.asset('images/campus.png'),
      ),
    );
  }
}