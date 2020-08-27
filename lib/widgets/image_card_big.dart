import 'package:flutter/material.dart';

class ImageCardBig extends StatelessWidget {
  ImageCardBig(this.uri, this.title);
  final String uri;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width - 32.0,
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xffbeff3f6),
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
                child: Image.asset('$uri'),
              )),
          Positioned(
            bottom: 16.0,
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.1),
                      Color.fromRGBO(0, 0, 0, 0.3),
                    ]),
              ),
              margin: EdgeInsets.only(left: 16.0),
              width: MediaQuery.of(context).size.width - 32.0,
              child: Center(
                  child: Text(
                '$title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}