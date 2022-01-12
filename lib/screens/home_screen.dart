import 'package:flutter/material.dart';
import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/models/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes App',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              final Note note = await NotesDatabase.instance.readNote(1);
              print(note.title);
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Search pressed');
            },
            icon: Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final note = Note(isImportant: false, number: 10, title: 'Test 1', description: 'This is a test', createdTime: DateTime.now());
          await NotesDatabase.instance.create(note);
        },
      ),
    );
  }
}
