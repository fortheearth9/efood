import 'package:flutter/material.dart';
import 'menu_service.dart';

class OrderingPage extends StatefulWidget {
  @override
  _OrderingPageState createState() => _OrderingPageState();
}

class _OrderingPageState extends State<OrderingPage> {
  // 已选菜品及其数量
  Map<String, int> selectedDishesQuantities = {};

  // 菜单数据
  List<Map<String, dynamic>> menu = [];

  // Set to keep track of selected dishes
  Set<String> selectedDishes = {};

  @override
  void initState() {
    super.initState();
    loadMenu();
  }

  Future<void> loadMenu() async {
    try {
      final data = await MenuService.loadMenu();
      setState(() {
        menu = List<Map<String, dynamic>>.from(data);
      });
    } catch (e) {
      print('Error loading menu: $e');
    }
  }

  void _toggleSelection(String dishName) {
    setState(() {
      if (selectedDishes.contains(dishName)) {
        selectedDishes.remove(dishName);
      } else {
        selectedDishes.add(dishName);
      }
    });
  }

  void _increment(String dishName) {
    setState(() {
      selectedDishesQuantities[dishName] =
          (selectedDishesQuantities[dishName] ?? 0) + 1;
    });
  }

  void _decrement(String dishName) {
    setState(() {
      if (selectedDishesQuantities[dishName] != null &&
          selectedDishesQuantities[dishName]! > 0) {
        selectedDishesQuantities[dishName] =
            selectedDishesQuantities[dishName]! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menu.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
          bottom: TabBar(
            isScrollable: true,
            tabs: menu.map((category) {
              return Tab(text: category['category']);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: menu.map((category) {
            var dishes = category['dishes'];
            return ListView.builder(
              itemCount: dishes.length,
              itemBuilder: (context, index) {
                var dish = dishes[index];
                var dishName = dish['name'];
                var isSelected = selectedDishes.contains(dishName);
                return GestureDetector(
                  onTap: () => _toggleSelection(dishName),
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
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
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
