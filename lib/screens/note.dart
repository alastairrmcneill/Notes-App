import 'package:flutter/material.dart';
import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/models/note_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: addNote, icon: Icon(Icons.check))],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      maxLines: 1,
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description',
                        ),
                        maxLines: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future addNote() async {
    final Note note = Note(
      title: _titleController.text,
      description: _descriptionController.text,
      isImportant: true,
      number: 100,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
    Navigator.of(context).pop();
  }
}
