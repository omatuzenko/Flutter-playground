import 'package:flutter/material.dart';
import 'screens/note_list.dart';
import 'screens/note_detail.dart';

///
/// Part1 - https://www.youtube.com/watch?v=1BwjNEKD8g8&index=25&list=PLlxmoA0rQ-Lw6tAs2fGFuXGP13-dWdKsB
/// Part 2 - https://www.youtube* .com/watch?v=wVSBUnNUr00&list=PLlxmoA0rQ-Lw6tAs2fGFuXGP13-dWdKsB&index=26
/// SQFlite - https://pub.dartlang.org/packages/sqflite
///
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NoteKeeper",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: NoteList(),
    );
  }
}
