import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                      child: Text('\$${cart.items.values.toList()[i].price}'),
                    ),
                  ),
                ),
                title: Text(cart.items.values.toList()[i].title),
                subtitle: Text('Total: \$${(cart.items.values.toList()[i].price * cart.items.values.toList()[i].quantity)}'),
                trailing: Text('${cart.items.values.toList()[i].quantity} x'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('Total: \$${cart.totalAmount}'),
          SizedBox(height: 10),
          ElevatedButton(
            child: Text('Order Now'),
            onPressed: () {
              // Implement your order functionality here
            },
          ),
        ],
      ),
    );
  }
}