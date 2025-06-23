// this page should includes: custom app bar, custom name

import 'package:flutter/material.dart';
import 'help.dart';

class EmployeeSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              handleHelpAction(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('员工管理.'),
      ),
    );
  }
}

void onEmployeeIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EmployeeSettingsPage()),
  );
}
