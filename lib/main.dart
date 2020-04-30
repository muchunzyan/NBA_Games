import 'package:flutter/material.dart';
import 'package:my_messenger/views/games.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NBA Games',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: GamesView(),
    );
  }
}
