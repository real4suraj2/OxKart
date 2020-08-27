import 'package:flutter/material.dart';

import 'package:oxkart/constants.dart';

class ImageCard extends StatelessWidget {
  ImageCard(this.uri, this.info, this.price);

  final String uri;
  final String info;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: Center(
              child: Image.asset('$uri'),
            ),
          ),
          Container(
            child: Text('$info',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[700])),
          ),
          Container(
            child: Text('$price', style: TextStyle(fontSize: 18.0)),
          ),
        ],
      ),
    );
  }
}
