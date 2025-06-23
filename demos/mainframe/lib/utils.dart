import 'package:flutter/material.dart';
import 'new_page.dart'; // Ensure this import is present
import 'dinning_table.dart'; // Ensure this import is present

String getFunctionName() {
  try {
    throw Exception();
  } catch (e, stackTrace) {
    var traceString = stackTrace.toString().split('\n')[1];
    var functionName =
        RegExp(r'#1\s+([^\s]+)\s+\(').firstMatch(traceString)?.group(1);
    return functionName ?? 'Unknown';
  }
}

void handlePressed(BuildContext context) {
  print('Icon pressed');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewPage()),
  );
}

void handlePersonOutlinePressed(BuildContext context) {
  print('Person Outline Icon pressed');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewPage()),
  );
}

void handleEmployeePressed(BuildContext context) {
  print('Employee Icon pressed');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewPage()),
  );
}
