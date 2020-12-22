import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

import 'package:oxkart/mock.dart';
import 'package:oxkart/keys.dart';

import 'package:oxkart/widgets/card_cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Widget> cartItems =
      List.generate(CART_PRODUCTS.length, (i) => CardCart(CART_PRODUCTS[i]));

  Razorpay razorpay;
  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": keyId,
      "amount": 228098,
      "name": "Oxkart Services",
      "description": "Net 4 products",
      "prefill": {"contact": "6266817302", "email": "real4suraj2@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Toast.show("Pament success", context);
  }

  void handlerErrorFailure() {
    print("Pament error");
    Toast.show("Pament error", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbeff3f6),
      appBar: AppBar(
        title: Text('Shopping Bag'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 200.0,
              child: ListView.builder(
                  itemCount: CART_PRODUCTS.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) =>
                      cartItems[index]),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  openCheckout();
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_basket,
                          size: 32.0, color: Colors.white),
                      SizedBox(width: 12.0),
                      Text(
                        'Proceed To Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
