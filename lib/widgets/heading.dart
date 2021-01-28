import 'package:flutter/material.dart';
import 'package:oxkart/screens/products_screen.dart';

class Heading extends StatelessWidget {
  Heading(this.heading);
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 12.0),
            child: Text(
              '$heading'.toUpperCase(),
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Products(heading),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.0),
              child: Text(
                'SEE ALL',
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
