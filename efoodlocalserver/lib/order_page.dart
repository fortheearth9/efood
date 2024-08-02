import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: const Center(
        child: Text('Order页面'),
      ),
    );
  }
}
