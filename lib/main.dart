import 'package:flutter/material.dart';
import 'package:oxkart/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context){
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: "Oxkart",
			theme: ThemeData(
				primaryColor: Colors.green,
				scaffoldBackgroundColor: Colors.white,
				fontFamily: 'Nunito',

			),
			home: Scaffold(
				body: Container(
					child: WelcomeScreen(),
				),
			)
		);
	}
}
