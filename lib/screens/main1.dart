import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
          onPressed: (){},
        ),
      ),
      floatingActionButton: Builder(
          builder: (context) =>
          new FloatingActionButton(
              child: new Icon(Icons.play_arrow),
              onPressed: getData,
          )),
    );
  }

  /**
   * [
      {
      "userId": 1,
      "id": 1,
      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      },
   */
  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "aplication/json",
        "key": "auth"
      },
    );

    List<dynamic> data = jsonDecode(response.body);
    var first = data[0];
    print(first['title']);
  }
}
