import 'package:flutter/material.dart';

class CardOrders extends StatelessWidget {
  CardOrders(this.product, this.quantity);
  final String product;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    print(product);
    print(quantity);
    return Container(
      height: 80.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 64.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            color: Color.fromRGBO(255, 255, 255, 0.8),
          ),
          child: Container(
            height: 80.0,
            margin: EdgeInsets.only(right: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.0,
                      child: Text(
                        product,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'Oxkart Pvt. Ltd',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                Text(
                  '$quantity kg',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
