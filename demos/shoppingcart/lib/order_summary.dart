import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final Map<String, int> selectedDishesQuantities;
  final List<Map<String, dynamic>> menu;
  final int Function() getTotalDishes;
  final double Function() getTotalAmount;

  OrderSummary({
    required this.selectedDishesQuantities,
    required this.menu,
    required this.getTotalDishes,
    required this.getTotalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Trigger a rebuild to show the updated order summary
            (context as Element).markNeedsBuild();
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
              Text('Total Dishes: ${getTotalDishes()}'),
              Text('Total Amount: \$${getTotalAmount().toStringAsFixed(2)}'),
            ],
          ),
        ),
      ],
    );
  }
}
