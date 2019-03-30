import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Title"),
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(Icons.accessibility),
          highlightColor: Colors.blueAccent,
//            child: new Text("Get data"),
          onPressed: callMethod(context),
        ),
      ),
      floatingActionButton: Builder(
          builder: (context) =>
          new FloatingActionButton(
              child: new Icon(Icons.play_arrow),
              onPressed: () {
                counter++;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(counter.toString()),
                ));
              }
          )),
    );
  }

  callMethod(BuildContext context) {

  }
}
