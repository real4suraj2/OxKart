import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';

import 'package:oxkart/mock.dart';
import 'package:oxkart/constants.dart';

import 'package:oxkart/widgets/image_card.dart';
import 'package:oxkart/widgets/sidebar/sidebar_layout.dart';
import 'package:oxkart/widgets/heading.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> pesticides = List.generate(IMG_DISPLAY_NO + 1, (i) {
    if (i == IMG_DISPLAY_NO) return ImageCard();
    return ImageCard(data: PESTICIDES[i], show: true);
  });
  List<Widget> products = List.generate(IMG_DISPLAY_NO + 1, (i) {
    if (i == IMG_DISPLAY_NO) return ImageCard();
    return ImageCard(data: FARM_PRODUCTS[i], show: true);
  });
  List<Widget> machines = List.generate(IMG_DISPLAY_NO + 1, (i) {
    if (i == IMG_DISPLAY_NO) return ImageCard();
    return ImageCard(data: FARM_MACHINES[i], show: true);
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffbeff3f6),
      body: Container(
        margin: EdgeInsets.only(top: 24.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/vines.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Heading('Crop Essentials'),
                  ),
                  SliverToBoxAdapter(
                    child: MasonryGrid(
                      column: GRID_SIZE,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      children: pesticides,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Heading('Farm Products'),
                  ),
                  SliverToBoxAdapter(
                    child: MasonryGrid(
                      column: GRID_SIZE,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      children: products,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Heading('Farm Essentials'),
                  ),
                  SliverToBoxAdapter(
                    child: MasonryGrid(
                      column: GRID_SIZE,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      children: machines,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 32.0,
                        height: 32.0,
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
                            Icons.menu,
                            size: 20.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
      endDrawer: SidebarLayout('dashboard'),
    );
  }
}
