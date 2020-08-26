import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  Heading(this.heading);
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 6.0),
      decoration: BoxDecoration(
        color: Color(0xffbeff3f6),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(4, 2),
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            offset: Offset(-4, -2),
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Text('$heading',
            style: TextStyle(
              fontFamily: 'Bukhari',
              fontSize: 18.0,
              color: Color(0xffb18d191),
            )),
      ),
    );
  }
}
