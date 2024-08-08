import 'package:flutter/material.dart';

class IconDetailPage extends StatelessWidget {
  final IconItem iconItem;

  IconDetailPage({required this.iconItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(iconItem.iconName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconItem.iconData,
              size: 100.0, // Large icon size
            ),
            SizedBox(height: 20),
            Text(
              iconItem.iconName,
              style: TextStyle(fontSize: 24.0), // Large font size
            ),
          ],
        ),
      ),
    );
  }
}

class IconItem {
  final IconData iconData;
  final String iconName;
  final void Function(BuildContext context) onPressed;

  IconItem(this.iconData, this.iconName, this.onPressed);
}
