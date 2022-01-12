import 'package:flutter/material.dart';

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
            onPressed: () {
              print('Search pressed');
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
        onPressed: () {
          print('Adding a new note');
        },
      ),
    );
  }
}
