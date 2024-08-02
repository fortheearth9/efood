import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // adjust the number of buttons in a row
        children: List.generate(4, (index) {
          // adjust the number of buttons
          return Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), padding: EdgeInsets.all(20)

                  // padding: EdgeInsets.all(20),
                  // backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
              child: Text('Feature $index',
                  style: TextStyle(color: Colors.white)), // text color
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeaturePage()),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

class FeaturePage extends StatelessWidget {
  const FeaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feature Page'),
      ),
      body: Center(
        child: Text('This is the Feature Page'),
      ),
    );
  }
}
