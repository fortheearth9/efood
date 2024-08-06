import 'package:flutter/material.dart';

class MenuGrid extends StatelessWidget {
  final List<Map<String, dynamic>> dishes;
  final Set<String> selectedDishes;
  final Map<String, int> selectedDishesQuantities;
  final Function(String) toggleSelection;
  final Function(String) increment;
  final Function(String) decrement;

  MenuGrid({
    required this.dishes,
    required this.selectedDishes,
    required this.selectedDishesQuantities,
    required this.toggleSelection,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
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
          onTap: () => toggleSelection(dishName),
          onSecondaryTap: () => decrement(dishName),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.transparent,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextButton(
              onPressed: () => toggleSelection(dishName),
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
                        color: Colors.red, // Red color for the number
                        fontSize: 24.0, // Bigger font size for the number
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
  }
}
