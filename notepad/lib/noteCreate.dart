/*
Author: Sean Fitzpatrick  2019-2-9
Description: This is the page used to create new and edit existing
  notes. If no note is passes in the constructor then it will
  create a new note. If a existing note is passed in then it will
  edit the existing one and fill the input feilds with the existing
  data.
*/

import 'package:flutter/material.dart';

import './note.dart';

class NoteCreate extends StatefulWidget {
  final Note editNote;

  NoteCreate({
    this.editNote,
  });

  @override
  _NoteCreateState createState() => _NoteCreateState(
        editNote: editNote,
        hasEditNote: editNote != null,
      );
}

class _NoteCreateState extends State<NoteCreate> {
  bool hasEditNote = false;
  Note editNote;

  _NoteCreateState({
    this.editNote,
    this.hasEditNote = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hasEditNote ? 'Edit Note' : 'Create Note'),
        backgroundColor: hasEditNote ? editNote.color : null,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: NoteForm(hasEditNote, editNote),
      ),
    );
  }
}

class NoteForm extends StatefulWidget {
  final bool hasEditNote;
  final Note editNote;

  NoteForm(this.hasEditNote, this.editNote);

  @override
  _NoteFormState createState() => _NoteFormState(hasEditNote, editNote);
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  bool _isImportant;
  Color _color;
  bool hasEditNote;
  Note editNote;

  _NoteFormState(this.hasEditNote, this.editNote) {
    titleController.text = hasEditNote ? editNote.title : '';
    contentController.text = hasEditNote ? editNote.content : '';
    _isImportant = hasEditNote ? editNote.isImportant : false;     
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) => Form(
        key: _formKey,
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
            _submitButton(ctx),
          ],
        ),
      );

  Widget _titleBox() {
    return TextFormField(
      controller: titleController,
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
    List colors = [
      ['Red', Colors.red],
      ['Green', Colors.green],
      ['Blue', Colors.blue],
      ['None', Colors.transparent],
    ];
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            icon: const Icon(Icons.color_lens),
            labelText: 'Color',
          ),
          isEmpty: _color == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _color,
              isDense: true,
              onChanged: (newValue) {
                setState(() {
                  _color = newValue;
                  state.didChange(newValue);
                });
              },
              items: colors.map((val) {
                String colorName = val[0];
                Color colorVal = val[1];
                return DropdownMenuItem(
                  value: colorVal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(colorName),
                      Icon(
                        Icons.indeterminate_check_box,
                        color: colorVal,
                      ),
                    ],
                  ),
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
        controller: contentController,
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
            color: _isImportant ? Colors.yellow : Colors.grey,
            size: 50.0,
          ),
          onPressed: () {
            setState(() {
              _isImportant = !_isImportant;
            });
          },
        ));
  }

  Widget _submitButton(BuildContext ctx) {
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
          if (_formKey.currentState.validate()) {
            Note newNote = Note(
              title: titleController.text,
              content: contentController.text,
              isImportant: _isImportant,
              color: _color,
            );
            Navigator.pop(ctx, newNote);
          }
        },
      ),
    );
  }
}
