import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE9E9E9),
        primarySwatch: Colors.orange,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.5,
          backgroundColor: Color(0xFFE9E9E9),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
