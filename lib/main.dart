import 'package:animated_slide/slideAnimation/presentation/FavoriteBooksPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slide Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FavoriteBooksPage(),
    );
  }
}
