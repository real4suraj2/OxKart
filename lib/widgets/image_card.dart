import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// import 'package:oxkart/constants.dart';
import 'package:oxkart/screens/product_screen.dart';

class ImageCard extends StatelessWidget {
  ImageCard(this.url, this.info, this.price);

  final String url;
  final String info;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      margin: EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Product(url, info, price),
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              child: CachedNetworkImage(
                imageUrl: '$url',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              child: Text('$info',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[700])),
            ),
            Container(
              child: Text('$price.00', style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
      ),
    );
  }
}
