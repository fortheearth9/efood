import 'package:flutter/material.dart';
import 'product.dart';
import 'product_view.dart';
import 'product_presenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> implements ProductView {
  late ProductPresenter _presenter;
  late Product _product;

  @override
  void initState() {
    super.initState();
    _presenter = ProductPresenter(this);
    _product = Product(1, 'Apple', 0.5);
    _presenter.showProductDetails(_product);
  }

  @override
  void displayProductDetails(Product product) {
    setState(() {
      _product = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Details:', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text('ID: ${_product.id}', style: TextStyle(fontSize: 18)),
            Text('Name: ${_product.name}', style: TextStyle(fontSize: 18)),
            Text('Price: \$${_product.price}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}