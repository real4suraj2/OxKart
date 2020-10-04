import 'package:flutter/material.dart';
import 'package:oxkart/services/auth.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: FlatButton(
              child: Text("Log Out"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                Auth().signOutUser(context);
              }),
        ),
      ),
    );
  }
}
