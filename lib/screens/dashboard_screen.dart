import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oxkart/services/store.dart';

import 'package:oxkart/widgets/heading.dart';
import 'package:oxkart/widgets/search_menu.dart';
import 'package:oxkart/widgets/image_card.dart';
import 'package:oxkart/widgets/image_card_small.dart';
import 'package:oxkart/widgets/image_card_big.dart';
import 'package:oxkart/widgets/drawer.dart';

// import 'package:oxkart/mock.dart'; --> Shift to firestore complete
import 'package:oxkart/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Store store = Store();

  Widget topItemsWidget() {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.none &&
                snap.hasData == null ||
            snap.data == null) {
          return Container();
        }
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snap.data.length,
            itemBuilder: (BuildContext context, int i) => ImageCardSmall(
                snap.data[i]['url'],
                snap.data[i]['name'],
                snap.data[i]['collection']));
      },
      future: store.categories,
    );
  }

  Widget bannerWidget() {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.none &&
                snap.hasData == null ||
            snap.data == null) {
          return Container();
        }
        return new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ImageCardBig(
                snap.data[index]['url'], snap.data[index]['slogan']);
          },
          control: new SwiperControl(),
          loop: true,
          autoplay: true,
          itemCount: snap.data.length,
          viewportFraction: 1.0,
          scale: 0.9,
        );
      },
      future: store.banners,
    );
  }

  Widget categoryItems(List<dynamic> data, String title) {
    return Container(
      child: Column(
        children: <Widget>[
          Heading('$title'),
          Container(
            height: 250.0,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => ImageCard(
                  data[index]['url'],
                  data[index]['title'],
                  "\u20B9" + data[index]['price']),
            ),
          ),
        ],
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
        List<String> keys = [];
        snap.data.forEach((k, v) => keys.add(k));

        return Column(
          children: List.generate(
              keys.length, (i) => categoryItems(snap.data[keys[i]], keys[i])),
        );
      },
      future: store.products,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbeff3f6),
      appBar: AppBar(
        title: Text('OXKART'),
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
              onTap: () {
                Navigator.pushNamed(context, profileRoute);
              },
              child: Icon(Icons.account_circle, size: 26.0),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SearchMenu(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    child: topItemsWidget(),
                  ),
                  SizedBox(height: 6.0),
                  SizedBox(
                      height: 1.0,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      )),
                  SizedBox(height: 6.0),
                  SizedBox(
                    height: 250.0,
                    width: MediaQuery.of(context).size.width,
                    child: bannerWidget(),
                  ),
                  Container(
                    child: productWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
