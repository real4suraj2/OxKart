import 'package:flutter/material.dart';

import 'package:oxkart/constants.dart';

import 'package:oxkart/screens/welcome_screen.dart';
import 'package:oxkart/screens/dashboard_screen.dart';
import 'package:oxkart/screens/profile_screen.dart';
import 'package:oxkart/screens/sell_screen.dart';
import 'package:oxkart/screens/search_screen.dart';
import 'package:oxkart/screens/cart_screen.dart';
// import 'package:oxkart/screens/product_screen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => Welcome());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case sellRoute:
        return MaterialPageRoute(builder: (_) => Sell());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => Profile());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => Cart());
      case searchRoute:
        return MaterialPageRoute(builder: (_) => Search());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(child: Text('No route named ${settings.name}'))));
    }
  }
}
