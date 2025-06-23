import 'package:flutter/material.dart';

// CommonSettingsPage widget
class CommonSettingsPage extends StatelessWidget {
  final String shopName;
  final String bannerImage;

  CommonSettingsPage({
    required this.shopName,
    required this.bannerImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('配置页面'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(bannerImage),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                shopName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Callback function to navigate to CommonSettingsPage
void onSettingsIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CommonSettingsPage(
        shopName: '招财猫餐饮收银系统',
        bannerImage: 'assets/1.jpg',
      ),
    ),
  );
}
