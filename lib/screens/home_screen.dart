import 'package:flutter/material.dart';
import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/note.dart';
import 'package:notes_app/widgets/note_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  late List<Note> notes;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(8, 0),
          child: const Text(
            'Notes App',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 28,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              print('Search pressed');
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              print('More pressed');
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoteScreen()),
          );

          refreshNotes();
        },
      ),
      body: isLoading
          ? const Text(
              'Loading',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          : notes.isEmpty
              ? const Text(
                  'No Notes',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final note = notes[index];
                    return NoteTile(note);
                  },
                ),
    );
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }
}
