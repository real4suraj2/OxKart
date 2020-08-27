import 'package:flutter/material.dart';

class SearchMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      color: Colors.green,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Container(
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 13.0),
              hintText: 'Search All Products',
              contentPadding: EdgeInsets.all(14.0),
            ),
          ),
        ),
      ),
    );
  }
}
