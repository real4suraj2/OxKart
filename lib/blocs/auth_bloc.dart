import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _auth = FirebaseAuth.instance;

  final _user = BehaviorSubject<User>();

  AuthBloc() {
    _auth.authStateChanges().listen((User user) {
      _user.add(user);
    });
  }
  Stream<User> get userStream => _user.stream;

  User get user => _user.value;

  void signOut() async {
    await _auth.signOut();
  }

  User isLoggedIn() {
    return _auth.currentUser;
  }

  void signinwithfacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);
    // Once signed in, return the UserCredential
    var userCred = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    _user.add(userCred.user);
  }

  void signinwithgoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn(
      scopes: [
        'email',
      ],
    ).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(credential);
  }

  dispose() {
    _user.close();
  }
}
