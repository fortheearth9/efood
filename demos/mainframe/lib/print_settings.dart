import 'package:flutter/material.dart';

// PrintSettingsPage widget
class PrintSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Settings'),
      ),
      body: Center(
        child: Text(
            'This is the print settings page. Configure your print settings here.'),
      ),
    );
  }
}

// PrintLogPage widget
class PrintLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Log'),
      ),
      body: Center(
        child: Text('This is the print log page. View your print logs here.'),
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
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrintSettingsPage()),
                );
              },
              child: Text('Go to Print Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrintLogPage()),
                );
              },
              child: Text('Go to Print Log'),
            ),
          ],
        ),
      ),
    );
  }
}

// Callback function to navigate to PrintSettingsPage
void onPrintIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PrintSettingsPage()),
  );
}

// Function to handle print action
void handlePrintAction(BuildContext context) {
  onPrintIconClicked(context);
}

// Callback function to navigate to PrintLogPage
void onPrintLogIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PrintLogPage()),
  );
}
