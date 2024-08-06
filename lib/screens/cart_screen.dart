import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final Map<String, int> cart;
  final Function(String) onRemoveFromCart;

  CartScreen({required this.cart, required this.onRemoveFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: cart.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
            trailing: Text('${entry.value}x'),
            leading: IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () => onRemoveFromCart(entry.key),
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
            },
            child: Text('Checkout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
