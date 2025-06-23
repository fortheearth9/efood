import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import intl package
import 'icons_page.dart'; // Import the IconsPage
import 'utils.dart'; // Import utility functions
import 'clock.dart'; // Import the Clock widget
import 'dinning_table.dart'; // Import the DinningTablesPage
import 'ordering_page.dart'; // Import the OrderingPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    title: 'ZCM',
    size: Size(1024, 768),
    minimumSize: Size(800, 600),
    titleBarStyle: TitleBarStyle.normal,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  // Initialize date formatting for Chinese locale
  await initializeDateFormatting('zh_CN', null);

  // Initialize tables
  // addTables(10); // Add 10 tables for example

  // getTables(); // Get tables from the server
  // load_menu(); // Load menu from the server

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '招财猫餐饮收银系统00',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IconsPage(), // Set IconsPage as the home page
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
