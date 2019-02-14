/*
Author: Sean Fitzpatrick  2019-2-14
Description: This is the detail view of a specific note.
  Ths contains the title of the note along with the content
*/

import 'package:flutter/material.dart';

import './note.dart';

class NoteView extends StatelessWidget {
  final Note currentNote;

  NoteView({
    @required this.currentNote,
  }) : assert(currentNote != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(currentNote.title),
            currentNote.isImportant
                ? Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : Icon(null),
          ],
        ),
        backgroundColor: currentNote.color,
      ),
      body: SizedBox.expand(
        child: Card(
          elevation: 7.0,
          margin: EdgeInsets.all(30.0),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              currentNote.content,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
