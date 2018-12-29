import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final Color color;

  ActivityWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}