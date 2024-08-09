import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:intl/date_symbol_data_local.dart'; // Import for initializing date formatting

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String _timeString = ''; // Declare _timeString as a late variable

  @override
  void initState() {
    super.initState();
    _timeString = ''; // Initialize _timeString to avoid LateInitializationError
    initializeDateFormatting('zh_CN', null).then((_) {
      _timeString = _formatDateTime(DateTime.now());
      Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    final dateFormatter = DateFormat('yyyy年M月d日 EEEE', 'zh_CN'); // Format for year, month, day, and weekday in Chinese
    final timeFormatter = DateFormat('H:mm:ss', 'zh_CN'); // Format for time in Chinese
    final formattedDate = dateFormatter.format(dateTime);
    final formattedTime = timeFormatter.format(dateTime);
    return "$formattedDate $formattedTime"; // Combine date and time with a space
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center, // Center align the text
    );
  }
}