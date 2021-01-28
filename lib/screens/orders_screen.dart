import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:oxkart/services/store.dart';
import 'package:oxkart/widgets/card_orders.dart';

// import 'package:oxkart/mock.dart'; --> Shift to firestore complete

class Orders extends StatelessWidget {
  final Store store = Store();

  Widget Status(String status) {
    if (status == null)
      return Text('Pending', style: TextStyle(color: Colors.orange));
    if (status == 'reject')
      return Text('Rejected', style: TextStyle(color: Colors.red));
    if (status == 'transit')
      return Text('In Transit', style: TextStyle(color: Colors.orangeAccent));
    return Text('Completed', style: TextStyle(color: Colors.green));
  }

  Widget orderItemWidget(Map<String, dynamic> data) {
    List<String> keys = [];
    data.forEach((k, v) {
      if (k != 'phone-number' && k != 'status' && k != 'address') keys.add(k);
    });
    return Column(
      children:
          List.generate(keys.length, (i) => CardOrders(keys[i], data[keys[i]])),
    );
  }

  Widget orderItemsWidget() {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.none &&
                snap.hasData == null ||
            snap.data == null) {
          return Container();
        }
        List<String> keys = [];
        snap.data.forEach((k, v) => keys.add(k));
        keys.sort((a, b) => int.parse(b).compareTo(int.parse(a)));

        return ListView.builder(
            itemCount: keys.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(DateFormat.yMMMd().add_jms().format(
                            new DateTime.fromMillisecondsSinceEpoch(
                                int.parse(keys[index])))),
                        Status(snap.data[keys[index]]['status'])
                      ],
                    ),
                    Container(
                      child: orderItemWidget(snap.data[keys[index]]),
                    ),
                  ],
                ));
      },
      future: store.orders,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbeff3f6),
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 150.0,
        margin: EdgeInsets.only(top: 16.0),
        child: orderItemsWidget(),
      ),
    );
  }
}
