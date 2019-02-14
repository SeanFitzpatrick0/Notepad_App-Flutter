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
        title: Text(currentNote.title),
      ),
    );
  }
}
