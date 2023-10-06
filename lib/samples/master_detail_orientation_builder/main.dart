import 'package:flutter/material.dart';
import 'detail_widget.dart';
import 'list_widget.dart';

void main() => runApp(MaterialApp(
  home: MasterDetailPage(),
  debugShowCheckedModeBanner: false,
));

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  static const int initialSelectedValue = 0;
  static const int numberOfItems = 10;
  static const double largeScreenWidthThreshold = 600;

  int selectedValue = initialSelectedValue;
  bool isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    isLargeScreen = _isLargeScreen(context);

    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        return Row(children: <Widget>[
          Expanded(
            child: ListWidget(count: numberOfItems, onItemSelected: _onItemSelected),
          ),
          isLargeScreen ? Expanded(child: DetailWidget(selectedValue)) : Container(),
        ]);
      }),
    );
  }

  void _onItemSelected(int value) {
    if (isLargeScreen) {
      selectedValue = value;
      setState(() {});
    } else {
      _navigateToDetailPage(value);
    }
  }

  bool _isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largeScreenWidthThreshold;
  }

  void _navigateToDetailPage(int value) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return DetailWidget(value);
      },
    ));
  }
}
