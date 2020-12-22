import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:oxkart/router.dart';
import 'package:oxkart/constants.dart';

import 'package:oxkart/services/auth.dart';

import 'package:oxkart/screens/dashboard_screen.dart';
import 'package:oxkart/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: Auth().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Oxkart",
          theme: ThemeData(
            primaryColor: Colors.green,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: LANG == 'English' ? 'Nunito' : 'Nakula',
          ),
          onGenerateRoute: CustomRouter.generateRoute,
          home: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);

    return (_user != null) ? Dashboard() : Welcome();
  }
}
