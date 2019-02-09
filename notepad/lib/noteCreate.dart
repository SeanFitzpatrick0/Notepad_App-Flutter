/*
Author: Sean Fitzpatrick  2019-2-9
Description: This is the page used to create new and edit existing
  notes. If no note is passes in the constructor then it will
  create a new note. If a existing note is passed in then it will
  edit the existing one and fill the input feilds with the existing
  data.
*/

import 'package:flutter/material.dart';

class NoteCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
    );
  }
}
