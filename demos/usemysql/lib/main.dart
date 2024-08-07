import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'feature_button.dart';

void main() {
  runApp(demoMenu());
  // runApp(BtnNaviPage());
}

class demoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/apple_icon.png'),
          ),
          title: Clock(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                // Handle action for 'Online Help'
              },
            ),
            IconButton(
              icon: Icon(Icons.print),
              onPressed: () {
                // Handle action for 'Print Management'
              },
            ),
            IconButton(
              icon: Icon(Icons.network_check),
              onPressed: () {
                // Handle action for 'Network Management'
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle action for 'Settings'
              },
            ),
          ],
        ),
        body: FoodList(),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String _timeString = '';

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final String formattedDateTime = _formatDateTime(DateTime.now());
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('kk:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text(_timeString);
  }
}

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var url = 'http://localhost:3000/food';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        this.data = data;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, id) {
        return ListTile(
          title: Text('Name: ${data[id]['name']}'),
          subtitle:
              Text('Type: ${data[id]['type']}, Price: ${data[id]['price']}'),
        );
      },
    );
  }
}
