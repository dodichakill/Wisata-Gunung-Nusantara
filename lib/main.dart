import 'package:flutter/material.dart';
import 'package:wisata_gunung_nusantara/mainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Gunung Nusantara',
      theme: ThemeData(
        primarySwatch: Colors.red,
        cardTheme: CardTheme(color: Colors.blue),
      ),
      home: MainScreen(),
    );
  }
}
