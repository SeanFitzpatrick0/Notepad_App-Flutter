/*
Author: Sean Fitzpatrick  2019-2-3
Description: This is the home screen for the app.
  Ths contains the list of users notes and dispays them
  as a list to the user.
  If no notes exist then will display text to encorage 
  the usere to add a note.
*/

import 'package:flutter/material.dart';

import './note.dart';
import './noteCreate.dart';

class Notepad extends StatelessWidget {
  //final List<Note> _notes = <Note>[];
  // Mock data
  final List<Note> _notes = <Note>[
    Note(
      title: 'Note 1',
      content: 'Test data',
    ),
    Note(
      title: 'Note 2',
      content: 'Test data',
      color: Colors.red,
      isImportant: true,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
    Note(
      title: 'Note 3',
      content: 'Test data',
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Notepad'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _listNotes(),
          _addNoteButton(ctx),
        ],
      ),
    );
  }

  Widget _listNotes() {
    if (_notes.isEmpty) {
      return Center(
        child: Text('Add a note.'),
      );
    }
    return Positioned(
      child: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (BuildContext ctx, int i) {
          return Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: _notes[i].color,
              border: Border.all(
                width: 2.0,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: ListTile(
              title: Text(_notes[i].title),
              trailing: Icon(
                Icons.star,
                color: _notes[i].isImportant ? Colors.yellow : null,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _addNoteButton(BuildContext ctx) {
    return Positioned(
        bottom: 30,
        right: 30,
        child: FloatingActionButton(
          tooltip: 'Add Note',
          child: new Icon(
            Icons.add,
            color: Colors.red,
          ),
          backgroundColor: Colors.yellow,
          onPressed: () {
            _navigateToCreateNote(ctx);
          },
        ));
  }

  void _navigateToCreateNote(BuildContext ctx) {
    if (Navigator.of(ctx).canPop()) {
      Navigator.of(ctx).pop();
    }
    Navigator.of(ctx).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return NoteCreate();
        },
      ),
    );
  }
}
