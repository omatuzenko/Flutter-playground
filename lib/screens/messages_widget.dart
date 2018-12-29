import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Messages'),
        ),
        body: Center(
          child: Text('Messages content'),
        ),
    );
  }
}