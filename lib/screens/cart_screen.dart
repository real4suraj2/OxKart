import 'package:flutter/material.dart';

import 'package:oxkart/mock.dart';
import 'package:oxkart/constants.dart';

import 'package:oxkart/widgets/card_cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Widget> cart_items =
      List.generate(CART_PRODUCTS.length, (i) => CardCart(CART_PRODUCTS[i]));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbeff3f6),
      appBar: AppBar(
        title: Text('Shopping Bag'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 200.0,
              child: ListView.builder(
                  itemCount: CART_PRODUCTS.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) =>
                      cart_items[index]),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_basket,
                          size: 32.0, color: Colors.white),
                      SizedBox(width: 12.0),
                      Text(
                        'Add To Bag',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
