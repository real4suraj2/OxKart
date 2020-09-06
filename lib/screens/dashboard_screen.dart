import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:oxkart/widgets/heading.dart';
import 'package:oxkart/widgets/search_menu.dart';
import 'package:oxkart/widgets/image_card.dart';
import 'package:oxkart/widgets/image_card_small.dart';
import 'package:oxkart/widgets/image_card_big.dart';
import 'package:oxkart/widgets/drawer.dart';

import 'package:oxkart/mock.dart';
import 'package:oxkart/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> topItems = List.generate(
      TOPCONTAINER.length,
      (i) => ImageCardSmall(
          TOPCONTAINER[i]['uri'], TOPCONTAINER[i]['title'][LANG]));

  List<Widget> categoryItems = List.generate(TOPCONTAINER.length, (i) {
    String title = TOPCONTAINER[i]['title'][LANG];
    return Container(
      child: Column(
        children: <Widget>[
          Heading('$title'),
          Container(
            height: 300.0,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => ImageCard(
                  'assets/images/logo.png',
                  'Oxkart Diet(Instant Plant Food) - 500 ml',
                  "\u20B9" + "250.00"),
            ),
          ),
        ],
      ),
    );
  });

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
              onTap: () {},
              child: Icon(Icons.shopping_cart, size: 26.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
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
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: TOPCONTAINER.length,
                        itemBuilder: (BuildContext context, int index) =>
                            topItems[index]),
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
                    child: new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ImageCardBig(SLOGANS[index]['uri'],
                            SLOGANS[index]['title'][LANG]);
                      },
                      control: new SwiperControl(),
                      loop: true,
                      autoplay: true,
                      itemCount: SLOGANS.length,
                      viewportFraction: 1.0,
                      scale: 0.9,
                    ),
                  ),
                  Container(
                    child: Column(
                      children: List.generate(
                          categoryItems.length, (i) => categoryItems[i]),
                    ),
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
