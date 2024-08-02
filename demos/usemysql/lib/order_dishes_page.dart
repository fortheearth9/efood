// when a desktop is clicked, the order dishes page is displayed, and the desktop number is passed as a parameter.
// show the order dishes page with the desktop number as the title.
// the order dishes page should have a list of dishes, and a button to order the dishes.


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderDishesPage extends StatefulWidget {
  final int desktopNumber;

  OrderDishesPage({required this.desktopNumber});

  @override
  _OrderDishesPageState createState() => _OrderDishesPageState();
}

class _OrderDishesPageState extends State<OrderDishesPage> {
  List<dynamic> dishes = [];

  @override
  void initState() {
    super.initState();
    fetchDishes();
  }

  void fetchDishes() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final data = json.decode(response.body);
    setState(() {
      dishes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desktop ${widget.desktopNumber}'),
      ),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(dishes[i]['title']),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Order'),
              content: Text('Order placed!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

