import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  @override
  _IconsPageState createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  List<IconItem> iconItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list of IconItem objects in initState
    iconItems = [
      IconItem(Icons.people, 'People', () => print('People pressed')),
      IconItem(Icons.person_outline, 'Person Outline',
          () => print('Person Outline pressed')),
      IconItem(Icons.star, 'Star', () => print('Star pressed')),
      IconItem(Icons.verified, 'Verified', () => print('Verified pressed')),
      IconItem(Icons.thumb_up, 'Thumb Up', () => print('Thumb Up pressed')),
      IconItem(
          Icons.thumb_down, 'Thumb Down', () => print('Thumb Down pressed')),
      IconItem(Icons.favorite, 'Favorite', () => print('Favorite pressed')),
      IconItem(Icons.favorite_border, 'Favorite Border',
          () => print('Favorite Border pressed')),
      IconItem(Icons.favorite_outline, 'Favorite Outline',
          () => print('Favorite Outline pressed')),
      IconItem(Icons.favorite_border_outlined, 'Favorite Border Outlined',
          () => print('Favorite Border Outlined pressed')),
      IconItem(Icons.favorite_border_rounded, 'Favorite Border Rounded',
          () => print('Favorite Border Rounded pressed')),
      IconItem(Icons.favorite_border_sharp, 'Favorite Border Sharp',
          () => print('Favorite Border Sharp pressed')),
      IconItem(Icons.home, 'Home', () => print('Home pressed')),
    ];
  }

  void iconFunction1() {
    print('Icon 1 pressed');
  }

  void iconFunction2() {
    print('Icon 2 pressed');
  }

  void iconFunction3() {
    print('Icon 3 pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icons Page'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: iconItems.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                    iconItems[index].iconData), // Use Icon widget with IconData
                onPressed:
                    iconItems[index].onPressed, // Call the appropriate function
              ),
              Text(iconItems[index].iconName),
            ],
          );
        },
      ),
    );
  }
}

class IconItem {
  final IconData iconData;
  final String iconName;
  final void Function() onPressed;

  IconItem(this.iconData, this.iconName, this.onPressed);
}
