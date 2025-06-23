import 'package:flutter/material.dart';
import 'ordering_page.dart'; // Correct import statement

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Center(
            onTableButtonClicked(); // Correct function call
          ),
        ),
      ),
    );
  }
}
