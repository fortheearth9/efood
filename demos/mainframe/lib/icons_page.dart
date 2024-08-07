import 'package:flutter/material.dart';

class IconsPage extends StatelessWidget {
  final List<IconData> icons = [
    Icons.home,
    Icons.business,
    Icons.school,
    Icons.access_alarm,
    Icons.account_balance,
    Icons.add_shopping_cart,
    Icons.airplanemode_active,
    Icons.battery_alert,
    Icons.beach_access,
    Icons.cake,
    Icons.call,
    Icons.camera,
    Icons.directions_car,
    Icons.email,
    Icons.favorite,
    Icons.flight,
    Icons.headset,
    Icons.lock,
    Icons.map,
    Icons.phone,
    Icons.shopping_cart,
    Icons.thumb_up,
    Icons.watch,
  ];

  final List<String> iconNames = [
    'home',
    'business',
    'school',
    'access_alarm',
    'account_balance',
    'add_shopping_cart',
    'airplanemode_active',
    'battery_alert',
    'beach_access',
    'cake',
    'call',
    'camera',
    'directions_car',
    'email',
    'favorite',
    'flight',
    'headset',
    'lock',
    'map',
    'phone',
    'shopping_cart',
    'thumb_up',
    'watch',
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
                icon: Icon(icons[index]),
                onPressed: () {},
              ),
              Text(iconNames[index]),
            ],
          );
        },
      ),
    );
  }
}
