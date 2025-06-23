import 'package:flutter/material.dart';

// StoreSettingsPage widget
class StoreSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Settings'),
      ),
      body: Center(
        child: Text(
            'This is the store settings page. Configure your store settings here.'),
      ),
    );
  }
}

// StoreLogPage widget
class StoreLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Log'),
      ),
      body: Center(
        child: Text('This is the store log page. View your store logs here.'),
      ),
    );
  }
}

// MainPage widget with navigation buttons
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoreSettingsPage()),
                );
              },
              child: Text('Go to Store Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoreLogPage()),
                );
              },
              child: Text('Go to Store Log'),
            ),
          ],
        ),
      ),
    );
  }
}

// Callback function to navigate to StoreSettingsPage
void onStoreIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StoreSettingsPage()),
  );
}

// Function to handle store action
void handleStoreAction(BuildContext context) {
  onStoreIconClicked(context);
}

// Callback function to navigate to StoreLogPage
void onStoreLogIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StoreLogPage()),
  );
}
