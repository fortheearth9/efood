import 'package:flutter/material.dart';
import 'new_page.dart'; // Import the new page
import 'clock.dart'; // Import the Clock widget

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
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class IconsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iconItems = _generateIconItems(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: Image.asset('assets/apple_icon.png'),
          child: Icon(Icons.apple, size: 48.0), // Set the icon size to 48.0
        ),
        title: Clock(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            iconSize: 48.0, // Set the icon size to 48.0
            onPressed: () {
              // Handle action for 'Online Help'
            },
          ),
          IconButton(
            icon: Icon(Icons.print),
            iconSize: 48.0, // Set the icon size to 48.0
            onPressed: () {
              // Handle action for 'Print Management'
            },
          ),
          IconButton(
            icon: Icon(Icons.network_check),
            iconSize: 48.0, // Set the icon size to 48.0
            onPressed: () {
              // Handle action for 'Network Management'
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            iconSize: 48.0, // Set the icon size to 48.0
            onPressed: () {
              // Handle action for 'Settings'
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 6, // Show 6 items per line
        children: iconItems,
      ),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }

  void handlePersonOutlinePressed(BuildContext context) {
    print('Person Outline Icon pressed');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }

  List<Widget> _generateIconItems(BuildContext context) {
    return [
      _createIconItem(Icons.people, 'People', Colors.lightBlueAccent, () => onPressed(context)),
      _createIconItem(Icons.person_outline, 'Person Outline', Colors.lightGreenAccent, () => handlePersonOutlinePressed(context)),
      _createIconItem(Icons.star, 'Star', Colors.yellowAccent, () => onPressed(context)),
      _createIconItem(Icons.verified, 'Verified', Colors.pinkAccent, () => onPressed(context)),
      _createIconItem(Icons.thumb_up, 'Thumb Up', Colors.cyanAccent, () => onPressed(context)),
      _createIconItem(Icons.thumb_down, 'Thumb Down', Colors.purpleAccent, () => onPressed(context)),
      _createIconItem(Icons.favorite, 'Favorite', Colors.orangeAccent, () => onPressed(context)),
      _createIconItem(Icons.favorite_border, 'Favorite Border', Colors.redAccent, () => onPressed(context)),
    ];
  }

  Widget _createIconItem(
      IconData iconData, String label, Color backgroundColor, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconItem(
        icon: Icon(iconData, size: 120.0), // Set the icon size to 120.0 (5 times bigger than the default 24.0)
        label: label,
        backgroundColor: backgroundColor,
        onPressed: onPressed,
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  final Icon icon;
  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;

  IconItem({required this.icon, required this.label, required this.backgroundColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(label),
          ],
        ),
      ),
    );
  }
}