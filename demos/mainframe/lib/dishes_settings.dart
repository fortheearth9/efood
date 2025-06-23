import 'package:flutter/material.dart';

// DishesSettingsPage widget
class DishesSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dishes Settings'),
      ),
      body: Center(
        child: Text(
            'This is the dishes settings page. Configure your dishes settings here.'),
      ),
    );
  }
}

// DishesLogPage widget
class DishesLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dishes Log'),
      ),
      body: Center(
        child: Text('This is the dishes log page. View your dishes logs here.'),
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
                  MaterialPageRoute(builder: (context) => DishesSettingsPage()),
                );
              },
              child: Text('Go to Dishes Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DishesLogPage()),
                );
              },
              child: Text('Go to Dishes Log'),
            ),
          ],
        ),
      ),
    );
  }
}

// Callback function to navigate to DishesSettingsPage
void onDishesIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DishesSettingsPage()),
  );
}

// Function to handle dishes action
void handleDishesAction(BuildContext context) {
  onDishesIconClicked(context);
}

// Callback function to navigate to DishesLogPage
void onDishesLogIconClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DishesLogPage()),
  );
}
