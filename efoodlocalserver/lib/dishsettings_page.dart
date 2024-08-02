import 'package:flutter/material.dart';

class DishsettingsPage extends StatelessWidget {
  const DishsettingsPage(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DishSettings'),
      ),
      body: const Center(
        child: Text('DishSettings页面'),
      ),
    );
  }
}
