import 'package:flutter/material.dart';
import '../models/product.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> _products = [
	Product(name: 'Product 1', price: 10.0),
	Product(name: 'Product 2', price: 20.0),
	Product(name: 'Product 3', price: 30.0),
  ];

  final List<Product> _cart = [];

  void _addToCart(Product product) {
	setState(() {
	  _cart.add(product);
	});
  }

  void _viewCart() {
	Navigator.of(context).push(
	  MaterialPageRoute(
		builder: (context) => CartScreen(cart: _cart),
	  ),
	);
  }

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
		title: Text('Products'),
		actions: [
		  IconButton(
			icon: Icon(Icons.shopping_cart),
			onPressed: _viewCart,
		  ),
		],
	  ),
	  body: ListView.builder(
		itemCount: _products.length,
		itemBuilder: (context, index) {
		  final product = _products[index];
		  return ListTile(
			title: Text(product.name),
			subtitle: Text('\$${product.price}'),
			trailing: IconButton(
			  icon: Icon(Icons.add_shopping_cart),
			  onPressed: () => _addToCart(product),
			),
		  );
		},
	  ),
	);
  }
}