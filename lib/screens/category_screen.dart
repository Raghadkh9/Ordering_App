// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Burgers", "image": "assets/Burger.jpg"},
    {"name": "Pizzas", "image": "assets/Pizza.jpg"},
    {"name": "Steaks", "image": "assets/Steak.jpg"},
    {"name": "Fries", "image": "assets/Fries.jpg"},
    {"name": "Noodles", "image": "assets/Noodles.jpg"},
    {"name": "Dessert", "image": "assets/Dessert.jpg"},
    {"name": "Coffee", "image": "assets/Coffee.jpg"},
    {"name": "Drinks", "image": "assets/Drinks.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          category["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category["name"]!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
