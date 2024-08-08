import 'package:flutter/material.dart';
import 'icons_page.dart'; // Import the new icons page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IconsPage(), // Set IconsPage as the home page
    );
  }
}
