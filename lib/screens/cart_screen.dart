import 'package:flutter/material.dart';
import 'package:oxkart/screens/dashboard_screen.dart';
import 'package:oxkart/services/store.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

// import 'package:oxkart/mock.dart'; --> Shift to firestore complete
import 'package:oxkart/keys.dart';

import 'package:oxkart/widgets/card_cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Store store = Store();
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

  // Left unused till backend completes
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

  Widget cartItemWidget() {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.none &&
                snap.hasData == null ||
            snap.data == null) {
          return Container();
        }
        return ListView.builder(
            itemCount: snap.data.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) =>
                CardCart(snap.data[index]));
      },
      future: store.cart,
    );
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
              height: MediaQuery.of(context).size.height - 150.0,
              child: cartItemWidget(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () async {
                  // openCheckout();
                  int length = (await store.cart).length;
                  final _addressController = TextEditingController();
                  _addressController.text =
                      'Default Address'; // --> change it with user db value
                  if (length == 0)
                    return Toast.show("Add products first!", context);
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Order Confirmation'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                  'Please review your cart before placing order. You will soon receive a call from us once you place your order'),
                              TextField(
                                  controller: _addressController,
                                  decoration: new InputDecoration(
                                      hintText: 'Default Address'),
                                  minLines: 1,
                                  maxLines: 5),
                            ],
                          ),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("Confirm"),
                                textColor: Colors.white,
                                color: Colors.green,
                                onPressed: () async {
                                  await store
                                      .placeOrder(_addressController.text);
                                  Navigator.pop(context);
                                  Toast.show("Order Placed! Keep Oxkarting :)",
                                      context,
                                      duration: Toast.LENGTH_LONG);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Dashboard()));
                                }),
                            FlatButton(
                                child: Text("Cancel"),
                                textColor: Colors.white,
                                color: Colors.green,
                                onPressed: () async {
                                  Navigator.pop(context);
                                }),
                          ],
                        );
                      });
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
