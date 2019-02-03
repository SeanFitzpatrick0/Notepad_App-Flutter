/*
Author: Sean Fitzpatrick  2019-2-3
Description: This class defines the stuctures for notes
*/

import 'package:flutter/material.dart';

class Note {
  final String title;
  final String content;
  final Color color;
  final bool isImportant;

  Note ({
    @required this.title,
    @required this.content,
    this.color,
    this.isImportant = false
  }) :  assert(title != null),
        assert(title.isNotEmpty),
        assert(content != null),
        assert(content.isNotEmpty);

  @override
  String toString() {
    return 
    '-- Note --\n|\ttitle: $title,\n|\tcontent: $content,\n|\tcolor: $color,\n|\tisImportant: $isImportant';
  }
}