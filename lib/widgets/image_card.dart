import 'package:flutter/material.dart';

import 'package:oxkart/constants.dart';

class ImageCard extends StatelessWidget {
  ImageCard({Key key, this.data, this.show = false}) : super(key: key);
  final Map<String, dynamic> data;
  final bool show;
  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Container(
        height: 200.0,
        margin: EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              color: Color(0xffbeff3f6),
              shape: BoxShape.circle,
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
            child: Center(
              child: new Icon(
                Icons.exit_to_app,
                size: 32.0,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      height: 200.0,
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xffbeff3f6),
        borderRadius: BorderRadius.circular(12.0),
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
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          Center(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/icons/loading2.gif',
              image: data['uri'],
              width: 120.0,
              height: 120.0,
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 50,
                  child: Text(data['name'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                ),
                Column(
                  children: <Widget>[
                    Text("\u20B9" + data['price'].toString(),
                        style: TextStyle(
                          fontFamily: 'Bukhari',
                          color: Color(0xffb18d191),
                        )),
                    Text(
                      "/" + data['unit'],
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
