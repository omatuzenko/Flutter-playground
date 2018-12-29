import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('More'),
        ),
        body: Center(
          child: Text('More content'),
        ),
    );
  }
}