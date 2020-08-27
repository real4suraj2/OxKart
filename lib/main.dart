import 'package:flutter/material.dart';

import 'package:oxkart/router.dart';
import 'package:oxkart/constants.dart';
import 'package:oxkart/mock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  bool _isAuthenticated() {
    // -------------- Skipped Integration -------------- //
    // -------------- Auth Integration ----------------- //
    return true;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Oxkart",
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: LANG == 'English' ? 'Nunito' : 'Nakula',
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: _isAuthenticated() ? dashboardRoute : welcomeRoute,
    );
  }
}
