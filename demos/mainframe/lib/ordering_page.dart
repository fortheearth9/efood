import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderingPage extends StatefulWidget {
  final String table_name;
  final Map<String, List<Map<String, dynamic>>> groupedMenuItems;
  final List<Map<String, dynamic>> menu;

  OrderingPage(
      {required this.table_name,
      required this.groupedMenuItems,
      required this.menu});

  @override
  _OrderingPageState createState() => _OrderingPageState();
}

class _OrderingPageState extends State<OrderingPage> {
  Set<String> selectedDishes = {};
  Map<String, int> selectedDishesQuantities = {};
  String tableStatus = '';

  void _increment(String dishName) {
    setState(() {
      if (selectedDishesQuantities.containsKey(dishName)) {
        selectedDishesQuantities[dishName] =
            selectedDishesQuantities[dishName]! + 1;
      } else {
        selectedDishesQuantities[dishName] = 1;
      }
      selectedDishes.add(dishName);
    });
  }

  void _decrement(String dishName) {
    setState(() {
      if (selectedDishesQuantities.containsKey(dishName) &&
          selectedDishesQuantities[dishName]! > 0) {
        selectedDishesQuantities[dishName] =
            selectedDishesQuantities[dishName]! - 1;
        if (selectedDishesQuantities[dishName] == 0) {
          selectedDishesQuantities.remove(dishName);
          selectedDishes.remove(dishName);
        }
      }
    });
  }

  int _getTotalDishes() {
    return selectedDishesQuantities.values
        .fold(0, (sum, quantity) => sum + quantity);
  }

  double _getTotalAmount() {
    double total = 0.0;
    selectedDishesQuantities.forEach((dishName, quantity) {
      var dish = widget.menu
          .expand((category) => category['dishes'] ?? [])
          .firstWhere((dish) => dish['Name'] == dishName, orElse: () => null);
      if (dish != null) {
        total += (dish['Price'] ?? 0) * quantity;
      }
    });
    return total;
  }

  // Removed the unused _updateTableStatus method

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.groupedMenuItems.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('点餐 - 桌台 ${widget.table_name}'),
          bottom: TabBar(
            isScrollable: true,
            tabs: widget.groupedMenuItems.keys.map((String category) {
              return Tab(text: category);
            }).toList(),
          ),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: TabBarView(
                children: widget.groupedMenuItems.keys.map((String category) {
                  var dishes = widget.groupedMenuItems[category] ?? [];
                  return GridView.builder(
                    padding: EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      var dish = dishes[index];
                      var dishName = dish['Name'] ?? 'Unknown';
                      var isSelected = selectedDishes.contains(dishName);
                      var quantity = selectedDishesQuantities[dishName] ?? 0;
                      return GestureDetector(
                        onTap: () => _increment(dishName),
                        onSecondaryTap: () => _decrement(dishName),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue.withOpacity(0.2)
                                : Colors.transparent,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextButton(
                            onPressed: () => _increment(dishName),
                            style: TextButton.styleFrom(
                              backgroundColor: quantity > 0
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.transparent,
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        dishName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        '¥${dish['Price'] ?? 0}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 8.0,
                                  right: 8.0,
                                  child: Text(
                                    '${quantity.toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 24.0,
                                    ),
                                  ),
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
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text('金钥匙烤鸭店\n桌台 ${widget.table_name}\n'
                      '${DateTime.now().toString()}'), // Replaced Clock with DateTime.now()
                  Expanded(
                    child: ListView(
                      children: selectedDishesQuantities.entries.map((entry) {
                        var dishName = entry.key;
                        var quantity = entry.value;
                        var dish = widget.menu
                            ?.expand((category) => category['dishes'] ?? [])
                            ?.firstWhere((dish) => dish['Name'] == dishName,
                                orElse: () => null);
                        if (dish != null) {
                          return ListTile(
                            title: Text('$dishName x $quantity'),
                            subtitle: Text('¥${dish['Price'] * quantity}'),
                          );
                        } else {
                          return ListTile(
                            title: Text('$dishName x $quantity'),
                            subtitle: Text('¥0'),
                          );
                        }
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('菜品小计: ${_getTotalDishes()}'),
                        Text('金额小计: ¥${_getTotalAmount().toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('立刻下单！'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
