import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:oxkart/constants.dart';

import 'package:oxkart/services/auth.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _toggle = true;
  Color _bg, _primary, _secondary;
  String _primaryTxt, _secondaryTxt, _tertiaryTxt;
  double _yOffset;
  bool _keyboardVisible = false;
  bool _loading = false;

  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(onChange: (bool visible) {
      setState(() {
        _keyboardVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (_toggle) {
      _bg = Colors.transparent;
      _primary = Colors.black;
      _secondary = Colors.green;
      _primaryTxt = "Welcome To";
      _secondaryTxt = "Oxkart";
      _tertiaryTxt =
          "India's food supply chain and B2B market place for farmers and retailers.";
      _yOffset = height;
    } else {
      _bg = Colors.green;
      _primary = Colors.white;
      _secondary = Colors.white;
      _primaryTxt = "We make farmers";
      _secondaryTxt = "Independent";
      _tertiaryTxt =
          "Buy | Sell agricultural products at reasonable prices only at Oxkart.";
      _yOffset = _keyboardVisible ? 100.0 : 300.0;
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/plants.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/vines2.png'),
                    fit: BoxFit.cover)),
          ),
          AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            color: _bg,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        children: <Widget>[
                          Text('$_primaryTxt',
                              style: TextStyle(fontSize: 32.0, color: _primary),
                              textAlign: TextAlign.center),
                          Text('$_secondaryTxt',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontFamily: 'Bukhari',
                                color: _secondary,
                              ),
                              textAlign: TextAlign.center),
                          SizedBox(height: 6.0),
                          Text('$_tertiaryTxt',
                              style: TextStyle(fontSize: 12.0, color: _primary),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                )),
                Container(
                    margin: EdgeInsets.only(bottom: 48.0),
                    child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    )),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 48.0),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.6, 1],
                              colors: [Colors.green, Colors.blue]),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _yOffset, 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: 24.0,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },
                      child: Center(
                        child: Image.asset('assets/icons/arrow_down.png'),
                      )),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100.0),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          child: TextField(
                            controller: _phoneController,
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
                              hintStyle: TextStyle(fontSize: 16.0),
                              hintText: 'Mobile Number',
                              prefixIcon: Icon(Icons.local_phone,
                                  size: 18.0, color: Colors.green),
                              contentPadding: EdgeInsets.all(14.0),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        child: GestureDetector(
                          onTap: () async {
                            final phone = _phoneController.text.trim();
                            await Auth().signInUser(phone, context);
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 100.0),
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100.0),
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: GestureDetector(
                      onTap: () {
                        Auth().skipLogin();
                      },
                      child: Center(
                        child: Text(
                          'Skip for now',
                          style: TextStyle(
                              color: Color(0xffbaaaaaa),
                              fontSize: 12.0,
                              decoration: TextDecoration.underline),
                        ),
                      )),
                ),
              ],
            ),
          ),
          if (_loading == true)
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              child: Center(
                child: Container(
                    width: 150.0,
                    child: Image.asset('assets/icons/Loading.gif')),
              ),
            ),
        ],
      ),
    );
  }
}
