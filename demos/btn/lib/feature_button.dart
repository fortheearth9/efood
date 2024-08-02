import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatelessWidget {
  
final List<String> fruits = [
  'Apple', 'Lemon', 'Pepper Hot', 'Carrot', 'Leaf', 'Seedling'
];

final Map<String, IconData> fruitIcons = {
  'Apple': FontAwesomeIcons.appleAlt,
  'Lemon': FontAwesomeIcons.lemon,
  'Pepper Hot': FontAwesomeIcons.pepperHot,
  'Carrot': FontAwesomeIcons.carrot,
  'Leaf': FontAwesomeIcons.leaf,
  'Seedling': FontAwesomeIcons.seedling,
};


    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu), // Use built-in Material icon
          ),
        ),
        body: GridView.builder(
          itemCount: fruits.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 2/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, i) => GridTile(
            child: TextButton(
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  // Icon(Icons.local_florist), // Use built-in Material
                  Icon(fruitIcons[fruits[i]]),
                  Text(fruits[i]), // Display the fruit name
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}