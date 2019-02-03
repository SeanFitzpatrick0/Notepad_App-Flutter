/*
Author: Sean Fitzpatrick  2019-2-3
Description: Root widget for the notepad app.
*/

import 'package:flutter/material.dart';

import './notepad.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad',
      home: Notepad(),
    );
  }
}
