import 'package:flutter/material.dart';

import 'package:oxkart/widgets/sidebar/sidebar_layout.dart';

class Sell extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Sell on Oxkart Screen'),
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
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: SidebarLayout('sell'),
    );
  }
}
