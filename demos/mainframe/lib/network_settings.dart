// this page should includes: custom app bar, custom name

import 'package:flutter/material.dart';
import 'help.dart';

class NetworkSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.network_check),
            onPressed: () {
              handleHelpAction(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
            '配置以及显示网络信息.'),
      ),
    );
  }
}

class NetworkLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络日志'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              handleHelpAction(context);
            },
          ),
        ],
      ),
      body: Center(
        child:
            Text('显示网络日志，建设中 ...'),
      ),
    );
  }
}

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              handleHelpAction(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NetworkSettingsPage()),
                );
              },
              child: Text('转到网络设置页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NetworkLogPage()),
                );
              },
              child: Text('跳转到网络日志页面'),
            ),
          ],
        ),
      ),
    );
  }
}

void onNetworkIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NetworkPage()),
  );
}
