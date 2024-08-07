import 'package:flutter/material.dart';

class IconsPage extends StatelessWidget {
  IconsPage({Key? key}) : super(key: key);

  final List<IconData> icons = const [
    Icons.people,
    Icons.person_outline,
    Icons.star,
    Icons.verified,
    Icons.thumb_up,
    Icons.thumb_down,
    Icons.favorite,
    Icons.favorite_border,
    Icons.favorite_outline,
    Icons.favorite_border_outlined,
    Icons.favorite_border_rounded,
    Icons.favorite_border_sharp,
    Icons.home,
  ];

  final List<String> iconNames = [
    'People',
    'Person Outline',
    'Star',
    'Verified',
    'Thumb Up',
    'Thumb Down',
    'Favorite',
    'Favorite Border',
    'Favorite Outline',
    'Favorite Border Outlined',
    'Favorite Border Rounded',
    'Favorite Border Sharp',
    'Home',
  ];

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
        itemCount: icons.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(icons[index]), // Use Icon widget with IconData
                onPressed: () {}, // Provide the required onPressed parameter
              ),
              Text(iconNames[index]),
            ],
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: IconsPage(),
//   ));
// }
