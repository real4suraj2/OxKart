import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oxkart/providers/bloc_provider.dart';
import 'package:oxkart/router.dart';
import 'package:oxkart/constants.dart';
import 'package:oxkart/screens/dashboard_screen.dart';
import 'package:oxkart/screens/welcome_screen.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => BlocProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Oxkart",
        theme: ThemeData(
          primaryColor: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: LANG == 'English' ? 'Nunito' : 'Nakula',
        ),
        onGenerateRoute: Router.generateRoute,
        home: AuthRedirector(),
      ),
    );
  }
}

class AuthRedirector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<BlocProvider>(context).bloc;
    return StreamBuilder<Object>(
        stream: authBloc.userStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) return Dashboard();
          return Welcome();
        });
  }
}
