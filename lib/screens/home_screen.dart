// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'popular_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> foods = [
    "Burger",
    "Pizza",
    "Steak",
    "Fries",
    "Noodles",
    "Dessert",
    "Coffee",
    "Drinks",
  ];
  List<String> popularItems = [
    "Chicken_Burger",
    "Fried_Chicken",
    "Pepperoni_Pizza",
    "Sushi",
    "Lasagna"
  ];
  List<Color> bgColors = [
    Color.fromARGB(255, 247, 233, 232),
    Color(0xFFD4EE3),
    Color.fromARGB(255, 249, 242, 237),
    Color.fromARGB(255, 232, 235, 231),
  ];
  Map<String, int> cart = {};

  Map<String, double> distances = {
    "Chicken_Burger": 1.0,
    "Fried_Chicken": 2.5,
    "Pepperoni_Pizza": 3.0,
    "Sushi": 1.8,
    "Lasagna": 2.0,
  };

  void _addToCart(String itemName) {
    setState(() {
      cart[itemName] = (cart[itemName] ?? 0) + 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Delivery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cart: cart,
                    onRemoveFromCart: (itemName) {
                      setState(() {
                        cart.remove(itemName);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLocationSection(context),
            _buildSearchBar(context),
            _buildBannerImage(context),
            _buildSectionTitle(
              context,
              title: "Categories",
              onSeeAllPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              },
            ),
            _buildFoodCategories(context),
            _buildSectionTitle(
              context,
              title: "Popular",
              onSeeAllPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PopularScreen()),
                );
              },
            ),
            _buildPopularItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red),
                  Text(
                    "Riyadh",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.red, size: 33),
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage:
                AssetImage("assets/login-avatar-icon_2373155.png!sw800"),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
                child: Icon(Icons.circle, size: 10, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 243, 243),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search for food",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.filter_list, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/banner.jpg",
          fit: BoxFit.cover,
          height: 200,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context,
      {required String title, required VoidCallback onSeeAllPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: onSeeAllPressed,
            child: Text(
              "See All",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCategories(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return Container(
            width: 130,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: bgColors[index % bgColors.length],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/${foods[index]}.jpg",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, color: Colors.red);
                    },
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  foods[index],
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularItems(BuildContext context) {
    final Map<String, double> prices = {
      "Chicken_Burger": 5.99,
      "Fried_Chicken": 6.50,
      "Pepperoni_Pizza": 8.99,
      "Sushi": 12.99,
      "Lasagna": 9.99,
    };

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularItems.length,
        itemBuilder: (context, index) {
          final itemName = popularItems[index];
          final itemPrice = prices[itemName];
          final itemDistance = distances[itemName]; 

          return Container(
            width: MediaQuery.of(context).size.width / 1.4,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          _addToCart(itemName);
                        },
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
