import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:oxkart/router.dart';
import 'package:oxkart/constants.dart';

import 'package:oxkart/services/auth.dart';

import 'package:oxkart/screens/dashboard_screen.dart';
import 'package:oxkart/screens/welcome_screen.dart';
import 'package:oxkart/widgets/error.dart';
import 'package:oxkart/widgets/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(home: Error());
    }

    // // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(home: Loading());
    }

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
