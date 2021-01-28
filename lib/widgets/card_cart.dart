import 'package:flutter/material.dart';

// import 'package:oxkart/constants.dart';
import 'package:oxkart/screens/cart_screen.dart';
import 'package:oxkart/services/store.dart';

class CardCart extends StatelessWidget {
  CardCart(this.cartProduct);
  final Map<String, dynamic> cartProduct;
  final Store store = Store();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 24.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            color: Color.fromRGBO(255, 255, 255, 0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 170.0,
                width: 100.0,
                margin: EdgeInsets.only(left: 6.0),
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Container(
                height: 170.0,
                width: MediaQuery.of(context).size.width - 185.0,
                margin: EdgeInsets.only(right: 6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 150.0,
                          child: Text(
                            cartProduct['item'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            print('Delete');
                            await store.deleteProduct(cartProduct['item']);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Cart()));
                          },
                          child: Icon(Icons.delete,
                              size: 22.0, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0),
                    // Text(
                    //   cartProduct['small_description'][LANG],
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(
                    //     fontSize: 10.0,
                    //     color: Colors.grey[400],
                    //   ),
                    // ),
                    SizedBox(height: 2.0),
                    Text(
                      'Oxkart Pvt. Ltd',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: 22.0,
                      width: 64.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(width: 1.0),
                          GestureDetector(
                            onTap: () async {
                              print('Add');
                              await store.updateCart({
                                cartProduct['item']:
                                    (int.parse(cartProduct['quantity']) + 1)
                                        .toString()
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Cart()));
                            },
                            child: Icon(Icons.add,
                                size: 16.0, color: Colors.grey[600]),
                          ),
                          Text(cartProduct['quantity']),
                          GestureDetector(
                            onTap: () async {
                              print('Remove');
                              if (cartProduct['quantity'] == '1') return;
                              await store.updateCart({
                                cartProduct['item']:
                                    (int.parse(cartProduct['quantity']) - 1)
                                        .toString()
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Cart()));
                            },
                            child: Icon(Icons.remove,
                                size: 16.0, color: Colors.grey[600]),
                          ),
                          SizedBox(width: 1.0),
                        ],
                      ),
                    ),
                    // Text(
                    //   "\u20B9" + cartProduct['price'],
                    //   style: TextStyle(fontSize: 16.0, color: Colors.green),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
