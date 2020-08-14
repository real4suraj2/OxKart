import 'package:flutter/material.dart';
import 'package:oxkart/widgets/login_btn.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _loginBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                LoginBtn(
                  type: 'Google',
                ),
                LoginBtn(type: 'Facebook'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Skip for now',
                    style: TextStyle(fontSize: 20.0, color: Colors.green),
                  ),
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/vines2.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 0,
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
                      child: Column(
                        children: <Widget>[
                          Text('All your needs',
                              style: TextStyle(
                                fontSize: 32.0,
                              ),
                              textAlign: TextAlign.center),
                          Text('Resolved',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontFamily: 'Bukhari',
                                color: Colors.green,
                              ),
                              textAlign: TextAlign.center),
                          Text(
                              'Buy | Sell agricultural products at reasonable prices.',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
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
                      _loginBottomSheet(context);
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
        ],
      ),
    );
  }
}
