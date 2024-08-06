import 'package:flutter/material.dart';
import 'package:ordering_app/screens/home_screen.dart';
import 'package:ordering_app/screens/category_screen.dart';
import 'package:ordering_app/screens/popular_screen.dart';
import 'package:ordering_app/screens/cart_screen.dart';
import 'package:ordering_app/widgets/welcome_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeWidget(),
        '/home': (context) => HomeScreen(),
        '/category': (context) => CategoryScreen(),
        '/popular': (context) => PopularScreen(),
        '/cart': (context) => CartScreen(
              cart: {},
              onRemoveFromCart: (itemName) {},
            ),
      },
    );
  }
}
