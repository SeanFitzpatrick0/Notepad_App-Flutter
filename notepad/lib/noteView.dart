/*
Author: Sean Fitzpatrick  2019-2-14
Description: This is the detail view of a specific note.
  Ths contains the title of the note along with the content
*/

import 'package:flutter/material.dart';

import './note.dart';
import './noteCreate.dart';

class NoteView extends StatelessWidget {
  final Note currentNote;

  NoteView({
    @required this.currentNote,
  }) : assert(currentNote != null);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: _appbar(),
      body: Stack(
        children: <Widget>[
          _contentBox(),
          _editButton(ctx),
          _deleteButton(ctx),
        ],
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
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
    );
  }

  Widget _contentBox() {
    return SizedBox.expand(
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
    );
  }

  Widget _editButton(BuildContext ctx) {
    return Positioned(
      bottom: 30,
      right: 30,
      child: FloatingActionButton(
        heroTag: 'Edit_btn',
        child: Icon(Icons.edit),
        onPressed: () => _navigateToEditNote(ctx, currentNote),
        tooltip: 'Edit',
      ),
    );
  }

  void _navigateToEditNote(BuildContext ctx, Note note) async {
    final Note editedNote = await Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (ctx) => NoteCreate(
              editNote: note,
            ),
      ),
    );
    if (editedNote != null) {
      Navigator.pop(ctx, editedNote);
    }
  }

  Widget _deleteButton(BuildContext ctx) {
    return Positioned(
      bottom: 100,
      right: 30,
      child: FloatingActionButton(
        heroTag: 'Delete_btn',
        child: Icon(Icons.delete),
        onPressed: () => Navigator.pop(ctx, 'DELETE'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
