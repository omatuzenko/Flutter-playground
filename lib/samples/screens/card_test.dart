import 'package:flutter/material.dart';

import 'package:play_with_me/samples/model/activity.dart';
import 'package:play_with_me/samples/utils/ui_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: UIConst.primary,
        backgroundColor: UIConst.backgroundContent,
      ),
      home: MyHomePage(title: 'Activities list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List activities;

  @override
  void initState() {
    activities = Activity.getHardcodedActivities();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
//      _counter++;
    });
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 3));

    setState(() {
//      _count += 5;
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
          child: _makeBody(),
          onRefresh: _handleRefresh,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Container _makeBody() => Container(
        // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: activities.length,
          itemBuilder: (BuildContext context, int index) {
            return _makeCard(activities[index]);
          },
        ),
      );

  Card _makeCard(Activity lesson) => Card(
        elevation: 1.0,
        margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(color: UIConst.cardBackground),
          child: _makeListTile(lesson),
        ),
      );

  Column _makeListTile(Activity activity) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: new Image.network(
                'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
          ),
          new Padding(
            padding: new EdgeInsets.all(7.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Icon(Icons.thumb_up),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text(
                    'Like',
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Icon(Icons.comment),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text('Comments',
                      style: new TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          ),
        ],
      );
}
