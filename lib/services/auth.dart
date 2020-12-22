import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String uid;
  User({this.uid});
}

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser firebaseUser) =>
        (firebaseUser != null) ? User(uid: firebaseUser.uid) : null);
  }

  Future<void> signInUser(String phone, BuildContext context) async {
    final _otpController = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: "+91" + phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.pop(context);
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (AuthException exception) {
          print("Error! Verification Failed");
          print(exception.message);
        },
        codeSent: (String id, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Enter the OTP'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _otpController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 3,
                            ),
                          ),
                          prefixIcon: Icon(Icons.vpn_key,
                              size: 18.0, color: Colors.green),
                          contentPadding: EdgeInsets.all(14.0),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                        child: Text("Confirm"),
                        textColor: Colors.white,
                        color: Colors.green,
                        onPressed: () async {
                          AuthCredential credential =
                              PhoneAuthProvider.getCredential(
                                  verificationId: id,
                                  smsCode: _otpController.text.trim());
                          await _auth.signInWithCredential(credential);
                          if (user != null) {
                            Navigator.pop(context);
                          }
                        }),
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> signOutUser(BuildContext context) async {
    await _auth.signOut();
    Navigator.pop(context);
  }

  void skipLogin() {}
}
