import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/appnotekeeper/models/note.dart';
import 'package:flutter_app/appnotekeeper/utils/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteDetail extends StatefulWidget {

  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {

  static var _priorities = ["High", "Low"];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            }),
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[

            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownListItem) {
                  return DropdownMenuItem<String> (
                    value: dropDownListItem,
                    child: Text(dropDownListItem),
                  );
                }).toList(),
                style: textStyle,
                value: getPriorityAsString(note.priority),
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint("User selected $valueSelectedByUser");
                    updatePriorityAsInt(valueSelectedByUser);
                  });
                }
              ),
            ),

            // Second element Note title
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint("Something changed in text title");
                  updateTitle();
                },
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),

            // Third element Note description
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint("Something changed in text description");
                  updateDescription();
                },
                decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            // Fourth element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("Save", textScaleFactor: 1.5),
                      onPressed: () {
                        setState(() {
                          debugPrint("Save button clicked");
                          _save();
                        });
                      }),
                  ),

                  Container(width: 5.0),

                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text("Delete", textScaleFactor: 1.5),
                        onPressed: () {
                          setState(() {
                            debugPrint("Delete button clicked");
                            _delete();
                          });
                        }),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    )
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updatePriorityAsInt(String value) {
    switch(value) {
      case "High":
        note.priority = 1;
        break;
      case "Low":
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch(value) {
      case 1:
        priority = _priorities[0]; // High
        break;
      case 2:
        priority = _priorities[1]; // Low
        break;
    }
    return priority;
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {

    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) { // Case 1: Update operation
      result = await helper.updateNote(note);
    } else { // Case 1: Insert operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      _showAlertDialog("Status", "Note Saved Successfully");
    } else {
      _showAlertDialog("Status", "Problem Saving Successfully");
    }
  }

  void _delete() async {
    moveToLastScreen();

    if (note.id == null) {
      _showAlertDialog("Status", "No Note was deleted");
      return;
    }

    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog("Status", "Note Deleted Successfully");
    } else {
      _showAlertDialog("Status", "Error occured while Deleting Note");
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog
    );
  }
}