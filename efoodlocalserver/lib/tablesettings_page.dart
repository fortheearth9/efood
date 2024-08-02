import 'package:flutter/material.dart';

class TableSettingsPage extends StatelessWidget {
  const TableSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableSettings'),
      ),
      body: const Center(
        child: Text('TableSettings页面'),
      ),
    );
  }
}
