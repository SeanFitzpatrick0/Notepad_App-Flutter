/*
Author: Sean Fitzpatrick  2019-2-9
Description: This is the page used to create new and edit existing
  notes. If no note is passes in the constructor then it will
  create a new note. If a existing note is passed in then it will
  edit the existing one and fill the input feilds with the existing
  data.
*/

import 'package:flutter/material.dart';

class NoteCreate extends StatefulWidget {
  @override
  _NoteCreateState createState() => _NoteCreateState();
}

class _NoteCreateState extends State<NoteCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: NoteForm(),
      ),
    );
  }
}

class NoteForm extends StatefulWidget {
  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _titleBox(),
                _colorDropDown(),
                _contentBox(),
              ],
            ),
            _isImportantButton(),
            _submitButton(),
          ],
        ),
      );

  Widget _titleBox() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.create),
        labelText: 'Title',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a title';
        }
      },
    );
  }

  Widget _colorDropDown() {
    String _color;
    List<String> _colors = ['RED', 'GREEN', 'BLUE'];
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            icon: const Icon(Icons.color_lens),
            labelText: 'Color',
          ),
          isEmpty: _color == '',
          child: new DropdownButtonHideUnderline(
            child: new DropdownButton(
              value: _color,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  _color = newValue;
                  state.didChange(newValue);
                });
              },
              items: _colors.map((String value) {
                return new DropdownMenuItem(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _contentBox() {
    return Expanded(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          labelText: 'Content',
          icon: Icon(Icons.dehaze),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
      ),
    );
  }

  Widget _isImportantButton() {
    return Positioned(
        right: 30,
        bottom: 90,
        child: IconButton(
          tooltip: 'Important',
          icon: Icon(
            Icons.star,
            color: Colors.grey,
            size: 50.0,
          ),
          onPressed: () {
            print('isImportant Pressed');
          },
        ));
  }

  Widget _submitButton() {
    return Positioned(
      bottom: 15.0,
      right: 15.0,
      child: FloatingActionButton(
        tooltip: 'Submit',
        backgroundColor: Colors.greenAccent,
        child: Icon(
          Icons.check,
          color: Colors.green,
        ),
        onPressed: () {
          print('Submit button pressed!');
        },
      ),
    );
  }
}
