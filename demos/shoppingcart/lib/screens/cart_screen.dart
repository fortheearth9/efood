import 'package:flutter/material.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
		title: Text('Cart'),
	  ),
	  body: ListView.builder(
		itemCount: cart.length,
		itemBuilder: (context, index) {
		  final product = cart[index];
		  return ListTile(
			title: Text(product.name),
			subtitle: Text('\$${product.price}'),
		  );
		},
	  ),
	);
  }
}