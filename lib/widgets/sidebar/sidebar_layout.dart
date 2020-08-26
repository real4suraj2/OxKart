import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'package:oxkart/constants.dart';

import 'package:oxkart/widgets/sidebar/sidebar_item.dart';

class SidebarLayout extends StatefulWidget {
  SidebarLayout(this.route);
  final String route;
  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> with AfterLayoutMixin {
  int selectedIndex = 0;
  LabeledGlobalKey _dashboardKey = LabeledGlobalKey("dashboardKey");
  LabeledGlobalKey _myCartKey = LabeledGlobalKey("myCardKey");
  LabeledGlobalKey _sellOnKey = LabeledGlobalKey("sellOnKey");

  RenderBox renderBox;
  double startYPosition;

  @override
  void initState() {
    setState(() {
      switch (widget.route) {
        case 'dashboard':
          selectedIndex = 0;
          break;
        case 'cart':
          selectedIndex = 1;
          break;
        case 'sell':
          selectedIndex = 2;
          break;
        default:
          selectedIndex = 3;
      }
    });
  }

  void onTabTap(int index) {
    setState(() {
      selectedIndex = index;
      switch (selectedIndex) {
        case 0:
          renderBox = _dashboardKey.currentContext.findRenderObject();
          break;
        case 1:
          renderBox = _myCartKey.currentContext.findRenderObject();
          break;
        case 2:
          renderBox = _sellOnKey.currentContext.findRenderObject();
          break;
      }

      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          width: 70,
          top: 0,
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: SidebarClipper(
                (startYPosition == null) ? 0 : startYPosition - 40,
                (startYPosition == null) ? 0 : startYPosition + 80,
                widget.route),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF051937),
                    Color(0xFF004d7a),
                    Color(0xFF008793),
                    Color(0xFF00bf72),
                    Color(0xFFa8eb12),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -20,
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      profileRoute, (Route<dynamic> route) => false);
                },
                child: Icon(
                  Icons.face,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: UserSearchDelegate());
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SidebarItem(
                      key: _dashboardKey,
                      text: "Dashboard",
                      onTabTap: () {
                        onTabTap(0);
                        if (widget.route != 'dashboard')
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              dashboardRoute, (Route<dynamic> route) => false);
                      },
                      isSelected: selectedIndex == 0,
                    ),
                    SidebarItem(
                      key: _myCartKey,
                      text: "My cart",
                      onTabTap: () {
                        onTabTap(1);
                        if (widget.route != 'cart')
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              cartRoute, (Route<dynamic> route) => false);
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    SidebarItem(
                      key: _sellOnKey,
                      text: "Sell on Oxkart",
                      onTabTap: () {
                        onTabTap(2);
                        if (widget.route != 'sell')
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              sellRoute, (Route<dynamic> route) => false);
                      },
                      isSelected: selectedIndex == 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      switch (widget.route) {
        case 'dashboard':
          renderBox = _dashboardKey.currentContext.findRenderObject();
          break;
        case 'profile':
          break;
        case 'search':
          break;
        case 'cart':
          renderBox = _myCartKey.currentContext.findRenderObject();
          break;
        case 'sell':
          renderBox = _sellOnKey.currentContext.findRenderObject();
          break;
      }
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }
}

class SidebarClipper extends CustomClipper<Path> {
  final double startYPosition, endYPosition;
  final String route;

  SidebarClipper(this.startYPosition, this.endYPosition, this.route);

  @override
  Path getClip(Size size) {
    Path path = Path();

    double width = size.width;
    double height = size.height;

    //up curve
    path.moveTo(width, 0);
    path.quadraticBezierTo(width / 3, 5, width / 3, 70);

    //down curve
    path.lineTo(width / 3, height - 70);
    path.quadraticBezierTo(width / 3, height - 5, width, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UserSearchDelegate extends SearchDelegate {
  final List<String> data = [
    'jute sack',
    'wheat',
    'corn',
    'rice',
    'coragen',
    'pesticides',
    'herbicides',
    'shakti',
    'tomato',
    'potato',
    'killer x',
    'grain',
    'pulses',
    'sprayer',
    'sack'
  ];

  final List<String> recent = [
    'jute sack',
    'corn',
    'shakti',
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        primaryColor: Colors.green,
        primaryTextTheme: theme.primaryTextTheme,
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          hintStyle: theme.textTheme.title.copyWith(
            color: Colors.white70,
            fontSize: 16.0,
          ),
        ),
        textTheme: theme.textTheme.copyWith(
            title: theme.textTheme.title.copyWith(
                color: theme.primaryTextTheme.title.color, fontSize: 16.0)));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: new Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recent
        : data.where((s) => s.startsWith(query)).toList();
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffbeff3f6),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: query.isEmpty
                ? new Icon(Icons.history)
                : new Icon(Icons.search),
            title: RichText(
                text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )),
          ),
          itemCount: suggestionList.length,
        ));
  }
}
