import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// import 'package:oxkart/constants.dart';
import 'package:oxkart/screens/product_screen.dart';

class ImageCardDescriptive extends StatelessWidget {
  ImageCardDescriptive(this.url, this.info, this.price);

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
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(12.0),
            color: Color.fromRGBO(255, 255, 255, 0.8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 120.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
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
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('$info',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.grey[700])),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child:
                          Text('$price.00', style: TextStyle(fontSize: 18.0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
