import 'package:flutter/material.dart';
import 'new_page.dart'; // Import the new page

class IconsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iconItems = _generateIconItems(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Icons Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: iconItems,
      ),
    );
  }

  void onPressed(BuildContext context) {
    print('Icon pressed');
    // print context
  }

  void handlePersonOutlinePressed(BuildContext context) {
    print('Person Outline Icon pressed');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }

  List<IconItem> _generateIconItems(BuildContext context) {
    return [
      _createIconItem(Icons.people, 'People', () => onPressed(context)),
      _createIconItem(
          Icons.person_outline, 'Person Outline', () => handlePersonOutlinePressed(context)),
      // _createIconItem(Icons.star, 'Star', () => onPressed(context)),
      // _createIconItem(Icons.verified, 'Verified', () => onPressed(context)),
      // _createIconItem(Icons.thumb_up, 'Thumb Up', () => onPressed(context)),
      // _createIconItem(Icons.thumb_down, 'Thumb Down', () => onPressed(context)),
      // _createIconItem(Icons.favorite, 'Favorite', () => onPressed(context)),
      // _createIconItem(Icons.favorite_border, 'Favorite Border', () => onPressed(context)),
    ];
  }

  IconItem _createIconItem(
      IconData iconData, String label, VoidCallback onPressed) {
    return IconItem(
      icon: Icon(iconData),
      label: label,
      onPressed: onPressed,
    );
  }
}

class IconItem extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onPressed;

  IconItem({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(label),
        ],
      ),
    );
  }
}