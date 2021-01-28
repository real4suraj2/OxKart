import 'package:flutter/material.dart';
import 'package:oxkart/screens/orders_screen.dart';
import 'package:oxkart/services/store.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
          ),
          _createDrawerItem(
            icon: Icons.shopping_cart,
            text: 'Shop by Category',
          ),
          _createDrawerItem(
              icon: Icons.local_shipping,
              text: 'My Orders',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Orders()));
              }),
          _createDrawerItem(
            icon: Icons.chat_bubble_outline,
            text: 'Forums',
          ),
          _createDrawerItem(
            icon: Icons.language,
            text: 'Language',
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.store,
            text: 'Sell on oxkart',
            onTap: () {
              // Store store = Store();
              // Map<String, dynamic> data = await store.orders;
              // print(data);
            },
          ),
          _createDrawerItem(
            icon: Icons.local_phone,
            text: 'Contact Us',
          ),
          _createDrawerItem(
            icon: Icons.location_on,
            text: 'Our Store Locations',
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.security,
            text: 'Privacy Policy',
          ),
          _createDrawerItem(
            icon: Icons.bug_report,
            text: 'Report an issue',
          ),
          ListTile(
            title: Text('v0.0.1 \u00a9 Oxkart 2020'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/drawer_header_background.jpg',
            ),
          ),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
