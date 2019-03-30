import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/appnotekeeper/models/note.dart';
import 'package:flutter_app/appnotekeeper/utils/db_helper.dart';
import 'note_detail.dart';
import 'package:sqflite/sqflite.dart';


class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(

      appBar: AppBar(
        title: Text("Notes"),
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        child: Icon(Icons.add),
        onPressed: () {
          debugPrint("FAB tapped");
          navigateToDetail(Note("", "", 2), "Add Note");
        },
      ),
    );
  }

  getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              
              leading: CircleAvatar(
                backgroundColor: getPriorityColor(this.noteList[position].priority),
                child: getPriorityIcon(this.noteList[position].priority),
              ),
              
              title: Text(noteList[position].title, style: titleStyle,),

              subtitle: Text(noteList[position].date),

              trailing: GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey),
                onTap: () {
                  _delete(context, noteList[position]);
                },
              ),

              onTap: () {
                debugPrint("ListTile Tapped");
                navigateToDetail(noteList[position], "Edit Note");
              },
              
            ),
          );
        },
    );
  }

  Color getPriorityColor(int priority) {
    switch(priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

  Icon getPriorityIcon(int priority) {
    switch(priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, "Note deleted successfully");
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder:
        (context) {
      return NoteDetail(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}