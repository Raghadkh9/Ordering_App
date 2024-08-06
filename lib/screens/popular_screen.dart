import 'package:flutter/material.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> popularItems = [
      "Chicken_Burger",
      "Fried_Chicken",
      "Pepperoni_Pizza",
      "Sushi",
      "Lasagna"
    ];

    final Map<String, double> prices = {
      "Chicken_Burger": 5.99,
      "Fried_Chicken": 6.50,
      "Pepperoni_Pizza": 8.99,
      "Sushi": 12.99,
      "Lasagna": 9.99,
    };

    final Map<String, double> distances = {
      "Chicken_Burger": 1.0,
      "Fried_Chicken": 2.5,
      "Pepperoni_Pizza": 3.0,
      "Sushi": 1.8,
      "Lasagna": 2.0,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Items'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: popularItems.length,
          itemBuilder: (context, index) {
            final itemName = popularItems[index];
            final itemPrice = prices[itemName];
            final itemDistance = distances[itemName];

            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/${itemName}.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, color: Colors.red);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                itemName.replaceAll('_', ' '),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '\$${itemPrice?.toStringAsFixed(2) ?? '0.00'}',
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${itemDistance?.toStringAsFixed(1) ?? '0.0'} KM',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
