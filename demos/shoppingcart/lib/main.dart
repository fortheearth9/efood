import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '点餐系统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderingPage(),
    );
  }
}

class OrderingPage extends StatefulWidget {
  @override
  _OrderingPageState createState() => _OrderingPageState();
}

class _OrderingPageState extends State<OrderingPage> {
  // 已选菜品及其数量
  Map<String, int> selectedDishesQuantities = {};

  // 菜单数据
  List<Map<String, dynamic>> menu = [];

  @override
  void initState() {
    super.initState();
    print('initState called');
    loadMenu().then((_) {
      print('Menu loaded');
      print('初始化已选菜品及数量: $selectedDishesQuantities');
      print('初始化菜单数据: $menu');
    });
  }

  Future<void> loadMenu() async {
    try {
      final String response = await rootBundle.loadString('assets/menu.json');
      final data = await json.decode(response);
      setState(() {
        menu = List<Map<String, dynamic>>.from(data);
      });
      print('Menu data set');
    } catch (e) {
      print('Error loading menu: $e');
    }
  }

  void _updateQuantity(String dishName, int change) {
    setState(() {
      if (selectedDishesQuantities.containsKey(dishName)) {
        selectedDishesQuantities[dishName] =
            (selectedDishesQuantities[dishName]! + change)
                .clamp(0, double.infinity)
                .toInt();
      } else {
        selectedDishesQuantities[dishName] = 1; // 初始化数量为1
      }
      if (selectedDishesQuantities[dishName]! <= 0) {
        selectedDishesQuantities.remove(dishName);
      }
    });
  }

  void _increment(String dishName) => _updateQuantity(dishName, 1);

  void _decrement(String dishName) {
    if (selectedDishesQuantities[dishName] != null &&
        selectedDishesQuantities[dishName]! > 1) {
      _updateQuantity(dishName, -1);
    }
  }

  void submitOrder() {
    // 提交订单逻辑
    print('提交订单: 已选菜品及数量 - $selectedDishesQuantities');
    // 这里可以添加更多的订单提交逻辑，比如调用API发送到服务器
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点餐系统'),
      ),
      body: Column(
        children: <Widget>[
          // 桌台号输入
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '桌台号',
                hintText: '请输入桌台号',
              ),
              onChanged: (value) {
                // 这里可以处理桌台号的变更逻辑
              },
            ),
          ),
          // 菜单列表
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                var category = menu[index]['category'];
                var dishes = menu[index]['dishes'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...dishes.map((dish) {
                      var dishName = dish['name'];
                      return ListTile(
                        title: Text(dishName),
                        subtitle: Text('\$${dish['price']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => _decrement(dishName),
                            ),
                            Text(
                              selectedDishesQuantities[dishName]?.toString() ??
                                  '0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => _increment(dishName),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
          // 已选菜品列表
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '已选菜品',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                for (var entry in selectedDishesQuantities.entries)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('${entry.key} x ${entry.value}'),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitOrder,
        tooltip: '提交订单',
        child: Icon(Icons.check),
      ),
    );
  }
}
