import 'package:flutter/material.dart';
import 'package:oxkart/services/store.dart';
import 'package:oxkart/widgets/image_card_descriptive.dart';
import 'package:oxkart/widgets/loading.dart';

import '../constants.dart';

class Products extends StatelessWidget {
  Products(this.kind);
  final String kind;
  final Store store = Store();

  Widget categoryItems(List<dynamic> data, String title) {
    if (data == null) return Loading();
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => ImageCardDescriptive(
            data[index]['url'],
            data[index]['title'],
            "\u20B9" + data[index]['price']),
      ),
    );
  }

  Widget productWidget() {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.none &&
                snap.hasData == null ||
            snap.data == null) {
          return Container();
        }
        return categoryItems(snap.data[kind], kind);
      },
      future: store.products,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbeff3f6),
      appBar: AppBar(
        title: Text(kind.toUpperCase()),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, cartRoute);
              },
              child: Icon(Icons.shopping_cart, size: 26.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.share, size: 26.0),
            ),
          ),
        ],
      ),
      body: Container(
        child: productWidget(),
      ),
    );
  }
}
