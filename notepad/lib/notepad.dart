/*
Author: Sean Fitzpatrick  2019-2-3
Description: This is the home screen for the app.
  Ths contains the list of users notes and dispays them
  as a list to the user.
  If no notes exist then will display text to encorage 
  the usere to add a note.
*/

import 'package:flutter/material.dart';

class Notepad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Notepad'),
        ),
      ),
      body: Center(
        child: Text('Add a note.'),
      ),
    );
  }
}