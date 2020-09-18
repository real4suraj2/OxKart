import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oxkart/providers/bloc_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<BlocProvider>(context).bloc;
    User user = authbloc.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          FlatButton.icon(
              label: Text('Log Out'),
              icon: Icon(Icons.logout),
              onPressed: () {
                authbloc.signOut();
                Navigator.pop(context);
              })
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(user.displayName),
            Image.network(
              user.photoURL,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
