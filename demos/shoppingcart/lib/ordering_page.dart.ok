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
        // Add "All" category
        menu.insert(0, {
          'category': 'All',
          'dishes': menu.expand((category) => category['dishes']).toList(),
        });
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
        _increment(dishName);
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
        if (selectedDishesQuantities[dishName] == 0) {
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
      var dish = menu
          .expand((category) => category['dishes'])
          .firstWhere((dish) => dish['name'] == dishName);
      total += dish['price'] * quantity;
    });
    return total;
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
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: TabBarView(
                children: menu.map((category) {
                  var dishes = category['dishes'];
                  return GridView.builder(
                    padding: EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8, // Number of buttons per row
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0, // Make the buttons square
                    ),
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      var dish = dishes[index];
                      var dishName = dish['name'];
                      var isSelected = selectedDishes.contains(dishName);
                      var quantity = selectedDishesQuantities[dishName] ?? 0;
                      return GestureDetector(
                        onTap: () => _toggleSelection(dishName),
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
                            onPressed: () => _toggleSelection(dishName),
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
                                          fontSize: 16.0, // Bigger font size
                                        ),
                                      ),
                                      Text(
                                        '\$${dish['price']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0, // Bigger font size
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
                                      color: Colors
                                          .red, // Red color for the number
                                      fontSize:
                                          24.0, // Bigger font size for the number
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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Order Now'),
                  ),
                  Expanded(
                    child: ListView(
                      children: selectedDishesQuantities.entries.map((entry) {
                        var dishName = entry.key;
                        var quantity = entry.value;
                        var dish = menu
                            .expand((category) => category['dishes'])
                            .firstWhere((dish) => dish['name'] == dishName);
                        return ListTile(
                          title: Text('$dishName x $quantity'),
                          subtitle: Text('\$${dish['price'] * quantity}'),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Total Dishes: ${_getTotalDishes()}'),
                        Text(
                            'Total Amount: \$${_getTotalAmount().toStringAsFixed(2)}'),
                      ],
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
