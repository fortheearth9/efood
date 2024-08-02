import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'desktop_page.dart';

class BtnNaviPage extends StatelessWidget {
  
final List<String> fruits = [
  'Desktop', 'Lemon', 'Pepper Hot', 'Carrot', 'Leaf', 'Seedling'
];

final Map<String, IconData> fruitIcons = {
  'Desktop': FontAwesomeIcons.appleAlt,
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 2/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, i) => GridTile(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(builder: (context) => DesktopPage()),
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(fruitIcons[fruits[i]]),
                  Text(fruits[i]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}