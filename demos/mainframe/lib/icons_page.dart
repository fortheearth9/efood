import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  @override
  _IconsPageState createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  List<void Function()> iconFunctions = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list of functions in initState
    iconFunctions = [
      iconFunction1,
      iconFunction2,
      iconFunction3,
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
                onPressed: () {
                  // Call the appropriate function by index
                  if (index >= 0 && index < iconFunctions.length) {
                    iconFunctions[index]();
                  } else {
                    print('Invalid index');
                  }
                },
              ),
              Text(iconNames[index]),
            ],
          );
        },
      ),
    );
  }
}
