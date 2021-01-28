import 'package:flutter/material.dart';
import 'package:oxkart/screens/products_screen.dart';

class ImageCardSmall extends StatelessWidget {
  ImageCardSmall(this.url, this.title, this.collection);
  final String url;
  final String title;
  final String collection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Products(collection),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  '$url',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Container(
              width: 60.0,
              child: Center(
                  child: Text(
                '$title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8.0,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
