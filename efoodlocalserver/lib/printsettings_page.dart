import 'package:flutter/material.dart';

class PrintSettingsPage extends StatelessWidget {
  const PrintSettingsPage(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrintSettings'),
      ),
      body: const Center(
        child: Text('PrintSettings页面'),
      ),
    );
  }
}